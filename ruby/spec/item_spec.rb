require_relative '../item'

describe Item do
  subject { described_class.new("Test Item", 10, 50) }

  describe '#to_s' do
    it 'prints out @name, @sell_in and @quality' do
      expect(subject.to_s).to eq("Test Item, 10, 50")
    end
  end
end

describe GeneralItem do
  let(:expired) { described_class.new("General Item", -1, 50)}
  let(:not_expired) { described_class.new("General Item", 2, 50)}
  let(:zero_quality) { described_class.new("General Item", 2, 0)}
  describe '#update_item' do
    context 'when sell_date is not negative' do
      before { not_expired.update_item}

      it 'quality reduced by one' do
        expect(not_expired.quality).to eq 49
      end

      it 'sell_in reduced by one' do
        expect(not_expired.sell_in).to eq 1
      end
    end

    context 'when sell_date is negative' do
      before { expired.update_item}

      it 'quality reduced by two' do
        expect(expired.quality).to eq 48
      end
    end

    it 'quality cannot be negative' do
      zero_quality.update_item
      expect(zero_quality.quality).to eq 0
    end
  end
end

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
