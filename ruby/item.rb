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
  MIN_QUALITY = 0
  MAX_QUALITY = 50
  DEGRADE_RATIO = 1

  def update_item
    update_quality
    @sell_in -= 1
  end

  private

  def update_quality
    @quality -= self.class::DEGRADE_RATIO * (expired? ? 2 : 1)
    correct_value
  end

  def correct_value
    if @quality < MIN_QUALITY
      @quality = MIN_QUALITY
    elsif @quality > MAX_QUALITY
      @quality = MAX_QUALITY
    end
  end

  def expired?
    @sell_in < 0
  end
end

class AgedBrieItem < GeneralItem
  DEGRADE_RATIO = -1
end

class SulfurasItem < Item
end

class BackstagePassItem < Item
end

class ConjuredItem < Item
end
