require "new_sequence"

describe NewSequence do
  describe "#next" do
    it "returns sequence with 4 rows" do
      expect(NewSequence.new('1').next).to eql('11')
    end

    it "returns sequence with 4 rows" do
      expect(NewSequence.new('221').next).to eql('2211')
    end
  end
end