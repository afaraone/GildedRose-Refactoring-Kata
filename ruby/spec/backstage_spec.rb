require_relative '../item'

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
