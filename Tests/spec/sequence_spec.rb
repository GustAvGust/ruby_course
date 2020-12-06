require "sequence"

describe Sequence do
  describe "#fillingSequenceTo" do
    it "returns sequence with 4 rows" do
      expect(Sequence.new(4).to_s).to eql("1\n11\n21\n1211")
    end
  end
end
