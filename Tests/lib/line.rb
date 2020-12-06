class Line
  def initialize(dig)
      @dig = dig
  end

  def to_s
      res = ""
      for item in @dig
          res += item.to_s
      end
      return res
  end

  def findNextLine
      counter = 1
      res = []

      if @dig.length == 1
          res.push(counter)
          res.push(@dig[0])
      end

      i = 0
      while i < @dig.length - 1 do
          if @dig[i] == @dig[i + 1]
              counter += 1
          end

          if @dig[i] != @dig[i + 1] 
              res.push(counter)
              res.push(@dig[i])
              counter = 1
          end

          if i == @dig.length - 2
              res.push(counter)
              res.push(@dig[i + 1])
          end

          i += 1
      end

      return Line.new(res)
  end
end