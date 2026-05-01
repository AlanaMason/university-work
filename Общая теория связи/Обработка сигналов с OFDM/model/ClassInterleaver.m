classdef ClassInterleaver < handle
    
    properties (SetAccess = private)
        isTransparent;
        InterleaverPattern;
        DeinterleaverPattern;
        LogLanguage;
    end

    methods
        function obj = ClassInterleaver(Params, LogLanguage)

            obj.isTransparent = Params.Interleaver.isTransparent;
            obj.LogLanguage = LogLanguage;

            if ~obj.isTransparent
                if ~Params.Encoder.isTransparent
                    BlockLength = round(Params.Source.NumBitsPerFrame / Params.Encoder.CodeRate);
                else
                    BlockLength = Params.Source.NumBitsPerFrame;
                end
                obj.InterleaverPattern = randperm(BlockLength);
                [~, obj.DeinterleaverPattern] = sort(obj.InterleaverPattern);
            end

        end

        function OutData = StepTx(obj, InData)

            if obj.isTransparent
               OutData = InData;
               return
            end

            OutData = InData(obj.InterleaverPattern);
        end

        function OutData = StepRx(obj, InData)

            if obj.isTransparent
               OutData = InData;
               return
            end

            OutData = InData(obj.DeinterleaverPattern);
        end
    end
end



