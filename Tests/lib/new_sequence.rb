class NewSequence
  attr_reader :row

  def initialize(row)
    @row = row
  end

  def next
    @row.chars.chunk {|n| n}.map {|el, els| [els.size.to_s, el]}.join
  end
end