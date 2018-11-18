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
  describe '#update_quality' do
    context 'when sell_date is not negative' do
      before { not_expired.update_quality}

      it 'quality reduced by one' do
        expect(not_expired.quality).to eq 49
      end

      it 'sell_in reduced by one' do
        expect(not_expired.sell_in).to eq 1
      end
    end

    context 'when sell_date is negative' do
      before { expired.update_quality}

      it 'quality reduced by two' do
        expect(expired.quality).to eq 48
      end
    end

    it 'quality cannot be negative' do
      zero_quality.update_quality
      expect(zero_quality.quality).to eq 0
    end
  end
end
