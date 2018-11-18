require_relative '../item'
require_relative '../gilded_rose'

items = [
  vest = GeneralItem.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  brie = AgedBrieItem.new(name="Aged Brie", sell_in=2, quality=0),
  elixir = GeneralItem.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  sulfuras_a = SulfurasItem.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  sulfuras_b = SulfurasItem.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  backstage_a = BackstagePassItem.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  backstage_b = BackstagePassItem.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  backstage_c = BackstagePassItem.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  conjured = ConjuredItem.new(name="Conjured Mana Cake", sell_in=3, quality=6)
]

describe 'feature' do
  subject = GildedRose.new(items)

  describe 'update after two days' do
    2.times { subject.update_quality }

    it 'vest has quality 18' do
      expect(vest.quality).to eq 18
    end

    it 'brie has quality 2' do
      expect(brie.quality).to eq 2
    end

    it 'elixir has qual 9' do
      expect(elixir.quality).to eq 5
    end

    it 'sulfuras keep qual 80' do
      expect(sulfuras_a.quality).to eq 80
      expect(sulfuras_b.quality).to eq 80
    end

    it 'backstage_a has qual 22' do
      expect(backstage_a.quality).to eq 22
    end

    it 'backstage_b has qual 50' do
      expect(backstage_b.quality).to eq 50
    end

    it 'backstage_c has qual 50' do
      expect(backstage_c.quality).to eq 50
    end

    it 'conjured has qual 2' do
      expect(conjured.quality).to eq 2
    end
  end
end
