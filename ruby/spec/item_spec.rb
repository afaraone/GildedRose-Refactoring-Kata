require_relative '../item'

describe Item do
  subject { described_class.new("Test Item", 10, 50) }

  describe '#to_s' do
    it 'prints out @name, @sell_in and @quality' do
      expect(subject.to_s).to eq("Test Item, 10, 50")
    end
  end
end
