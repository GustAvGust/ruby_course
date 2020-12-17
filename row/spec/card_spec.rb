require "card"

RSpec.describe Card do

  def card(params = {})
    defaults = {
      rank: 7,
      suit: :hearts  
    }

    described_class.new(**defaults.merge(params))
  end

  it "a card has rank" do
    # expect(Card.new(rank: 7, suit: :hearts).rank).to eql(7)
    expect(card.rank).to eql(7)
  end

  it "a card has suit" do
    expect(card.suit).to eql(:hearts)
  end

  it "card eqls to itself" do
    expect(card).to eq(card)
  end

  it "a 10 higher then a 7" do
    card10 = card(rank: 10)
    card7 = card()

    expect(card10).to be > card7
  end

  it "a ace higher then a 7" do
    cardA = card(rank: :ace)
    card7 = card()

    expect(cardA).to be > card7
  end

  it "a ace higher then a jack" do
    cardA = card(rank: :ace)
    cardJ = card(rank: :jack)

    expect(cardA).to be > cardJ
  end

  it "a 10 h higher then a 7 d" do
    card10 = card(rank: 10, suit: :hearts)
    card7 = card(suit: :diamonds)

    expect(card10).to be > card7
  end

  it "unknown rank" do
    expect { card(rank: 11) }.to raise_error("unknown rank")
  end
  
  it "unknown suit" do
    expect { card(suit: :AAA) }.to raise_error("unknown suit")
  end

  it "prints human readable card name" do
    expect(card.to_s).to eql("7\u2665")
  end
end