# jack, queen, king, ace
# hearts, spades, clubs, diamonds

# card = Card.new(rank: 7, suit: hearts)
# card.rank
# card.suit
# 7H > 6H
# 7H == 7H
# Card.new(rank: 7, suit: hearts).to_s => 7H

# expect(one).to eql(other)
# raise "Error" unless one == other

class Card
  
  @@suits = [:hearts, :spades, :clubs, :diamonds]

  def initialize(rank: , suit:)
    if (rank == :jack) 
      @rank = 11
    elsif (rank == :queen)
      @rank = 12
    elsif (rank == :king)
      @rank = 13
    elsif (rank == :ace)
      @rank = 14
    elsif (rank >= 2 && rank <= 10)
      @rank = rank
    else
      raise "unknown rank"
    end

    if (@@suits.include?(suit))
      @suit = suit
    else
      raise "unknown suit"
    end
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

  def ==(card)
    self.rank == card.rank && self.suit == card.suit
  end

  def > (card)
    self.rank > card.rank
  end

  def to_s
    rank = self.rank
    suit = self.suit
    res = ""

    if (rank == 11) 
      res += :J
    elsif (rank == 12)
      res += :Q
    elsif (rank == 13)
      res += :K
    elsif (rank == 14)
      res += :A
    else
      res += rank.to_s
    end

    if (suit == :hearts)
      res += "\u2665"
    elsif (suit == :spades)
      res += "\u2660"
    elsif (suit == :clubs)
      res += "\u2663"
    else
      res += "\u2666"
    end
    
  end
end