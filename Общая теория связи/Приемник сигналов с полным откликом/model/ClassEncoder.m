classdef ClassEncoder < handle
    properties (SetAccess = private)
        isTransparent;
        TypeEncoder;
        Trellis;
        TbDepth;
        DecodingType;
        LogLanguage;
    end

    properties (SetAccess = private)
        CodeRateCC;
        CodeRateLDPC;
        LDPCEncCfg;
        LDPCDecCfg;
    end

    methods
        function obj = ClassEncoder(Params, LogLanguage)
            if nargin < 1 || isempty(Params) || ~isfield(Params,'Encoder')
                error('ClassEncoder:InvalidInput', 'Params with field ''Encoder'' must be provided.');
            end
            Encoder = Params.Encoder;

            % helper
            function v = getf(s,name,def)
                if nargin<3, def = []; end
                if isstruct(s)
                    if isfield(s,name), v = s.(name); else v = def; end
                else
                    if isprop(s,name), v = s.(name); else v = def; end
                end
            end

            obj.isTransparent = getf(Encoder,'isTransparent', true);
            obj.TypeEncoder   = getf(Encoder,'TypeEncoder','Convolution');
            obj.Trellis       = getf(Encoder,'Trellis',[]);
            obj.TbDepth       = getf(Encoder,'TbDepth',[]);
            obj.DecodingType  = getf(Encoder,'DecodingType','hard');
            obj.LogLanguage   = LogLanguage;

            if strcmpi(obj.TypeEncoder,'LDPC')
                cr = getf(Encoder,'CodeRateLDPC',[]);
                if isempty(cr)
                    error('ClassEncoder:MissingField','Params.Encoder.CodeRateLDPC must be provided for LDPC.');
                end
                obj.CodeRateLDPC = cr;
                % parity-check matrix from DVB-S.2 style (ok for many toy setups)
                H = dvbs2ldpc(obj.CodeRateLDPC);
                obj.LDPCEncCfg = ldpcEncoderConfig(H);
                obj.LDPCDecCfg = ldpcDecoderConfig(H);
            else
                obj.CodeRateLDPC = [];
                obj.LDPCEncCfg = [];
                obj.LDPCDecCfg = [];
            end

            % conv code rate (if possible)
            if ~isempty(obj.Trellis) && isfield(obj.Trellis,'numInputSymbols') && isfield(obj.Trellis,'numOutputSymbols')
                obj.CodeRateCC = log2(obj.Trellis.numInputSymbols) / log2(obj.Trellis.numOutputSymbols);
            else
                obj.CodeRateCC = [];
            end
        end

        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end

            switch obj.TypeEncoder
                case 'Convolution'
                    if isempty(obj.Trellis), error('No Trellis for convolutional encoder'); end
                    OutData = convenc(InData, obj.Trellis);

                case 'LDPC'
                    if isempty(obj.LDPCEncCfg), error('No LDPC encoder config'); end
                    if ~iscolumn(InData), InData = InData(:); end

                    K = obj.LDPCEncCfg.NumInformationBits;   % K
                    nBlocks = ceil(length(InData)/K);
                    InP = [InData; zeros(nBlocks*K - length(InData),1)];

                    OutData = zeros(nBlocks * obj.LDPCEncCfg.BlockLength, 1); % prealloc
                    pos = 1;
                    for b = 1:nBlocks
                        blk = InP((b-1)*K+1 : b*K);
                        % ensure type is logical/double 0/1
                        blk = reshape(double(blk(:)),K,1);
                        cw = ldpcEncode(blk, obj.LDPCEncCfg); % N-by-1
                        OutData(pos:pos+length(cw)-1) = cw(:);
                        pos = pos + length(cw);
                    end
                    OutData = OutData(:); % column vector

                otherwise
                    error('Unknown encoder type: %s', obj.TypeEncoder);
            end
        end

        function OutData = StepRx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end

            switch obj.TypeEncoder
                case 'Convolution'
                    if isempty(obj.Trellis) || isempty(obj.TbDepth)
                        error('Trellis and TbDepth required for convolutional decoding');
                    end
                    
                    OutData = vitdec(InData, obj.Trellis, obj.TbDepth, 'trunc', obj.DecodingType);

                case 'LDPC'
                    if isempty(obj.LDPCDecCfg), error('No LDPC decoder config'); end
                    if ~iscolumn(InData), InData = InData(:); end

                    % Heuristic: if inputs are only 0/1 values (hard decisions),
                    % convert them to strong LLRs: +LLR for bit0, -LLR for bit1.
                    % If inputs already look like LLRs (contain values outside {0,1}), we trust them.
                    uniqVals = unique(InData);
                    if all(ismember(uniqVals, [0;1])) && numel(uniqVals) <= 2
                        % treat as hard decisions -> convert to large magnitude LLRs
                        LLRmag = 20; % large positive magnitude means confident decision
                        llr_in = (1 - 2*InData) * LLRmag;  % 0 -> +LLRmag, 1 -> -LLRmag
                        if strcmpi(obj.LogLanguage,'debug')
                            warning('ClassEncoder:HardToLLR','Converted hard decisions to LLRs (mag=%g).',LLRmag);
                        end
                    else
                        llr_in = InData; % assume already LLRs
                    end

                    N = obj.LDPCDecCfg.BlockLength; % codeword length
                    K = obj.LDPCDecCfg.NumInformationBits;
                    nBlocks = ceil(length(llr_in)/N);
                    llr_pad = [llr_in; zeros(nBlocks*N - length(llr_in),1)]; % neutral padding LLR=0

                    decoded_all = zeros(nBlocks*K,1);
                    posd = 1;
                    maxIter = 50; % allow more iterations (tweakable)
                    for b = 1:nBlocks
                        llr_blk = llr_pad((b-1)*N+1 : b*N);
                        % call ldpcDecode: returns decoded info bits (K-by-1), optional outputs exist
                        decoded = ldpcDecode(llr_blk, obj.LDPCDecCfg, maxIter);
                        % ensure column, numeric 0/1
                        decoded_all(posd:posd+K-1) = double(decoded(:));
                        posd = posd + K;
                    end

                    % Return decoded information bits (concatenated). Note: if original Tx info length
                    % was not a multiple of K, the end will contain decoded bits for the padded part.
                    OutData = decoded_all(:);

                otherwise
                    error('Unknown encoder type: %s', obj.TypeEncoder);
            end
        end
    end
end
