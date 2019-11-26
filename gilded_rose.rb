# frozen_string_literal: true

class GildedRose
  BACKSTAGE = 'Backstage passes to a TAFKAL80ETC concert'
  AGED = 'Aged Brie'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  CONJURED = 'Conjured'
  MAX_QUALITY = 50
  CONJURED_QUALITY = 80

  def initialize(items)
    @items = items
  end

  def update_quality
    return if @items.nil?

    sell_in_changes = 1
    quantity_changes = 1
    @items.each do |item|
      case item.name
      when SULFURAS
        item.quality = CONJURED_QUALITY if item.quality != CONJURED_QUALITY
        next
      when AGED
        quantity_changes = item.quality >= MAX_QUALITY ? 0 : -1
      when BACKSTAGE
        quantity_changes = item.sell_in < 11 ? (item.sell_in < 6 ? -3 : -2) : -1
        if item.sell_in <= 0
          item.quality = 0
          quantity_changes = 0
        end
      when CONJURED
        # it's not clear from the task that condition
        # `Once the sell by date has passed, Quality degrades twice as fast`
        #  should takes any affect here
        quantity_changes = item.sell_in.negative? ? 4 : 2
      else
        quantity_changes = 2 if item.sell_in.negative?
      end

      item.quality -= quantity_changes
      item.quality = 0 if item.quality.negative?
      item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
      item.sell_in -= sell_in_changes

      sell_in_changes = 1
      quantity_changes = 1
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
