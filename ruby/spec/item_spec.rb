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

describe BackstagePassItem do
  let(:expired) { described_class.new("Backstage Pass", 0, 30)}
  let(:less_than_five) { described_class.new("Backstage Pass", 2, 30)}
  let(:less_than_ten) { described_class.new("Backstage Pass", 8, 30)}
  let(:ten_or_greater) { described_class.new("Backstage Pass", 10, 30)}

  describe '#update item' do
    context 'sell_by is 10+' do
      it 'quality increases by 1' do
        ten_or_greater.update_item
        expect(ten_or_greater.quality).to eq 31
      end
    end

    context 'sell_by is 5-9' do
      it 'quality increases by 2' do
        less_than_ten.update_item
        expect(less_than_ten.quality).to eq 32
      end
    end

    context 'sell_by is 1-4' do
      it 'quality increases by 3' do
        less_than_five.update_item
        expect(less_than_five.quality).to eq 33
      end
    end

    context 'sell_by is <= 0' do
      it 'quality set to 0' do
        expired.update_item
        expect(expired.quality).to eq 0
      end
    end
  end
end
