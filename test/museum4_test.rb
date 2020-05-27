require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'minitest/autorun'
require 'mocha/minitest'

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX", cost: 15})

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @tj = Patron.new("TJ", 7)
    @tj.add_interest("IMAX")
    @tj.add_interest("Dead Sea Scrolls")
    @dmns.admit(@tj)

    @patron_1 = Patron.new("Bob", 10)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("IMAX")
    @dmns.admit(@patron_1)
  end

  def test_it_can_group_name_with_exhibit
    expected = {
      "Gems and Minerals" => @gems_and_minerals,
      "Dead Sea Scrolls" => @dead_sea_scrolls,
      "IMAX" => @imax
    }
    assert_equal expected, @dmns.exhibits_by_name
  end

  # def test_it_can_reduce_money
  #   assert_equal 7, @tj.spending_money
  #   assert_equal 0, @patron_1.spending_money
  # end
end
