require "./lib/exhibit"
require 'minitest/autorun'

class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  def test_its_initail_values
    assert_equal "Gems and Minerals", @exhibit.name
    assert_equal 0, @exhibit.cost
  end
end
