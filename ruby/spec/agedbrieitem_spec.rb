require_relative '../item'

describe AgedBrieItem do
  let(:expired) { described_class.new('Aged Brie', -1, 20)}
  let(:not_expired) { described_class.new('Aged Brie', 5, 20)}
  let(:max_quality) { described_class.new('Aged Brie', 5, 50)}

  describe '#update_item' do
    context 'brie is not expired' do
      it 'quality increases by 1' do
        not_expired.update_item
        expect(not_expired.quality).to eq 21
      end
    end

    context 'brie is expired' do
      it 'quality increases by 2' do
        expired.update_item
        expect(expired.quality).to eq 22
      end
    end

    context 'quality is max' do
      it 'quality does not increase' do
        max_quality.update_item
        expect(max_quality.quality).to eq 50
      end
    end
  end
end
