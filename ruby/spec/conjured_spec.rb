require_relative '../item'

describe ConjuredItem do
  let(:expired) { described_class.new("General Item", -1, 50)}
  let(:not_expired) { described_class.new("General Item", 2, 50)}

  describe '#update_item' do
    context 'when sell_date is not negative' do
      before { not_expired.update_item}

      it 'quality reduced by two' do
        expect(not_expired.quality).to eq 48
      end
    end

    context 'when sell_date is negative' do
      before { expired.update_item}

      it 'quality reduced by two' do
        expect(expired.quality).to eq 46
      end
    end
  end
end
