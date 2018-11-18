class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class GeneralItem < Item
  def update_quality
    @quality -= expired? ? 2 : 1
    @quality = 0 if @quality < 0
    @sell_in -= 1
  end

  private

  def expired?
    @sell_in < 0
  end
end

class AgedBrieItem < Item
end

class SulfurasItem < Item
end

class BackstagePassItem < Item
end

class ConjuredItem < Item
end
