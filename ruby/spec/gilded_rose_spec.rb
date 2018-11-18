require_relative '../gilded_rose'

describe GildedRose do
  let(:mock_item_one) { double(:mock_item_one)}
  let(:mock_item_two) { double(:mock_item_two)}
  let(:mock_items) { [mock_item_one, mock_item_two] }
  subject { described_class.new(mock_items)}

  describe "#update_quality" do
    it 'calls #update_item on each item' do
      mock_items.each do |item|
        allow(item).to receive(:update_item)
        expect(item).to receive(:update_item)
      end
      subject.update_quality
    end
  end
end
