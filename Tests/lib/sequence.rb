require "line"

class Sequence
    def initialize(n)
        if n < 0
            @sequence = "Not exists sequence"
        else
            @sequence = ""
            fillingSequenceTo(n)
        end
    end

    def fillingSequenceTo(n)
        if n == 0
            @sequence = "Empty sequence"
            return
        end

        list = [1]
        
        line = Line.new(list)

        if n == 1
            @sequence += line.to_s
        else
            @sequence += line.to_s + "\n"
        end

        i = 0
        while i < n - 1
            line = line.findNextLine
            @sequence += line.to_s
            if i < n - 2
                @sequence += "\n"
            end
            i += 1
        end
    end

    def to_s
        @sequence
    end
end