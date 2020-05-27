require ".,lib/patron"
require 'minitest/autorun'

class PatronTest < Minitest::Test

  def setup
    @patron = Patron.new("Bob", 20)
  end

  def test_its_initial_values
    assert_equal "Bob", @patron.name
    assert_equal 20, @patron.spending_money
    assert_equal [], @patron.interests
  end
end
