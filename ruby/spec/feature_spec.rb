require_relative '../item'
require_relative '../gilded_rose'

describe GildedRose do
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
  subject {described_class.new(items)}
end
