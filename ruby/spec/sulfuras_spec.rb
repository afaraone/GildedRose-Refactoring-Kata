require_relative '../item'

describe SulfurasItem do
  let(:expired) { described_class.new('Aged Brie', -1, 80)}
  let(:not_expired) { described_class.new('Aged Brie', 5, 80)}

  describe 'when past sell_by' do
    it 'quality does not degrade' do
      expired.update_item
      expect(expired.quality).to eq 80
    end
  end

  describe 'when not past sell_by' do
    it 'quality does not degrade' do
      not_expired.update_item
      expect(not_expired.quality).to eq 80
    end
  end
end
