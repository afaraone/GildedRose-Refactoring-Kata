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
  RATIO = -1

  def update_item
    update_quality
    @sell_in -= 1
  end

  private

  def update_quality
    @quality += change_amount
    correct_value
  end

  def change_amount
    self.class::RATIO * (expired? ? 2 : 1)
  end

  def correct_value
    @quality = [@quality, MAX_QUALITY].min
    @quality = [@quality, MIN_QUALITY].max
  end

  def expired?
    @sell_in < 1
  end
end

class AgedBrieItem < GeneralItem
  RATIO = 1
end

class SulfurasItem < GeneralItem
  RATIO = 0

  def correct_value
    nil
  end
end

class BackstagePassItem < GeneralItem
  def update_item
    super
    @quality = 0 if expired?
  end

  def change_amount
    return 3 if @sell_in.between?(1, 4)
    return 2 if @sell_in.between?(5, 9)
    return 1
  end
end

class ConjuredItem < GeneralItem
  RATIO = -2
end
