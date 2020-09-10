require './lib/exhibit'
require './lib/patron'
require 'minitest/autorun'
require 'minitest/pride'

class PatronTest < Minitest::Test
  def test_it_has_attributes
    patron_1 = Patron.new("Bob", 20)
    assert_equal "Bob", patron_1.name
    assert_equal 20, patron_1.spending_money
  end

  def test_it_knows_interests
    patron_1 = Patron.new("Bob", 20)
    assert_equal [], patron_1.interests
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], patron_1.interests
  end
end
