# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it "doesn't change names and makes correct updates" do
      items = [Item.new('+5 Dexterity Vest', 1, 20),
               Item.new(GildedRose::AGED, 2, 0),
               Item.new('Elixir of the Mongoose', 5, 7),
               Item.new(GildedRose::SULFURAS, 0, 79),
               Item.new(GildedRose::SULFURAS, -1, 81),
               Item.new(GildedRose::CONJURED, 3, 12),
               Item.new(GildedRose::BACKSTAGE, 11, 20),
               Item.new(GildedRose::BACKSTAGE, 10, 49),
               Item.new(GildedRose::BACKSTAGE, 5, 49)
      ]

      # ------------ Day 1 ---------------
      GildedRose.new(items).update_quality

      expect(items[0].name).to eq('+5 Dexterity Vest')
      expect(items[0].sell_in).to eq(0)
      expect(items[0].quality).to eq(19)

      expect(items[1].name).to eq(GildedRose::AGED)
      expect(items[1].sell_in).to eq(1)
      expect(items[1].quality).to eq(1)

      expect(items[3].name).to eq(GildedRose::SULFURAS)
      expect(items[3].sell_in).to eq(0)
      expect(items[3].quality).to eq(80)

      expect(items[3].name).to eq(GildedRose::SULFURAS)
      expect(items[4].sell_in).to eq(-1)
      expect(items[4].quality).to eq(80)

      expect(items[5].name).to eq(GildedRose::CONJURED)
      expect(items[5].sell_in).to eq(2)
      expect(items[5].quality).to eq(10)

      expect(items[6].sell_in).to eq(10)
      expect(items[6].quality).to eq(21)

      expect(items[7].sell_in).to eq(9)
      expect(items[7].quality).to eq(50)

      expect(items[8].sell_in).to eq(4)
      expect(items[8].quality).to eq(50)

      # ------------ Day 2 ---------------
      GildedRose.new(items).update_quality

      expect(items[0].quality).to eq(18)

      expect(items[1].sell_in).to eq(0)
      expect(items[1].quality).to eq(2)

      expect(items[3].name).to eq(GildedRose::SULFURAS)
      expect(items[3].sell_in).to eq(0)
      expect(items[3].quality).to eq(80)

      expect(items[4].name).to eq(GildedRose::SULFURAS)
      expect(items[4].sell_in).to eq(-1)
      expect(items[4].quality).to eq(80)

      expect(items[5].sell_in).to eq(1)
      expect(items[5].quality).to eq(8)

      expect(items[6].sell_in).to eq(9)
      expect(items[6].quality).to eq(23)

      expect(items[7].sell_in).to eq(8)
      expect(items[7].quality).to eq(50)

      expect(items[8].sell_in).to eq(3)
      expect(items[8].quality).to eq(50)

      # ------------ Day 3 ---------------
      GildedRose.new(items).update_quality

      expect(items[0].quality).to eq(16)

      expect(items[1].sell_in).to eq(-1)
      expect(items[1].quality).to eq(3)

      expect(items[5].sell_in).to eq(0)
      expect(items[5].quality).to eq(6)

      expect(items[6].sell_in).to eq(8)
      expect(items[6].quality).to eq(25)

      expect(items[7].sell_in).to eq(7)
      expect(items[7].quality).to eq(50)

      expect(items[8].sell_in).to eq(2)
      expect(items[8].quality).to eq(50)

      # ------------ Day 4 ---------------
      GildedRose.new(items).update_quality

      expect(items[5].sell_in).to eq(-1)
      expect(items[5].quality).to eq(4)

      expect(items[6].sell_in).to eq(7)
      expect(items[6].quality).to eq(27)

      expect(items[7].sell_in).to eq(6)
      expect(items[7].quality).to eq(50)

      expect(items[8].sell_in).to eq(1)
      expect(items[8].quality).to eq(50)

      # ------------ Day 5 ---------------
      GildedRose.new(items).update_quality

      expect(items[5].sell_in).to eq(-2)
      expect(items[5].quality).to eq(0)

      expect(items[6].sell_in).to eq(6)
      expect(items[6].quality).to eq(29)

      expect(items[7].sell_in).to eq(5)
      expect(items[7].quality).to eq(50)

      expect(items[8].sell_in).to eq(0)
      expect(items[8].quality).to eq(50)

      # ------------ Day 6 ---------------
      GildedRose.new(items).update_quality

      expect(items[5].sell_in).to eq(-3)
      expect(items[5].quality).to eq(0)

      expect(items[6].sell_in).to eq(5)
      expect(items[6].quality).to eq(31)

      expect(items[7].sell_in).to eq(4)
      expect(items[7].quality).to eq(50)

      expect(items[8].sell_in).to eq(-1)
      expect(items[8].quality).to eq(0)
    end
  end
end
