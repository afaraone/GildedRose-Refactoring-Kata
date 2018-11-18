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
end

class AgedBrieItem < Item
end

class SulfurasItem < Item
end

class BackstagePassItem < Item
end

class ConjuredItem < Item
end
