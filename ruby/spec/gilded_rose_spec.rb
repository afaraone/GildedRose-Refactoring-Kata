require_relative '../gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    let(:mock_item) { double(:mock_item, name: "foo", sell_in: 0, quality: 0)}
    let(:mock_items) { [mock_item] }
    subject { described_class.new(mock_items)}
  end
end
