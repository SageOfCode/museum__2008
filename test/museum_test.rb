require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'minitest/autorun'
require 'minitest/pride'

class MuseumTest < Minitest::Test

  def test_it_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    assert_equal [], dmns.exhibits
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    assert_equal [gems_and_minerals, dead_sea_scrolls, imax], dmns.exhibits
  end

  def test_it_can_recommend_based_on_interests
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")
    assert_equal [dead_sea_scrolls, gems_and_minerals], dmns.recommend_exhibits(patron_1)
    assert_equal [imax], dmns.recommend_exhibits(patron_2)
  end

  def test_it_can_add_patrons
     dmns = Museum.new("Denver Museum of Nature and Science")
     gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
     dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
     imax = Exhibit.new({name: "IMAX",cost: 15})
     dmns.add_exhibit(gems_and_minerals)
     dmns.add_exhibit(dead_sea_scrolls)
     dmns.add_exhibit(imax)
     assert_equal [], dmns.patrons
     patron_1 = Patron.new("Bob", 0)
     patron_1.add_interest("Gems and Minerals")
     patron_1.add_interest("Dead Sea Scrolls")
     patron_2 = Patron.new("Sally", 20)
     patron_2.add_interest("Dead Sea Scrolls")
     patron_3 = Patron.new("Johnny", 5)
     patron_3.add_interest("Dead Sea Scrolls")
     dmns.admit(patron_1)
     dmns.admit(patron_2)
     dmns.admit(patron_3)
     assert_equal [patron_1, patron_2, patron_3], dmns.patrons
  end

  def test_it_knows_patrons_by_exhibit_interest
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      assert_equal [], dmns.patrons
      patron_1 = Patron.new("Bob", 0)
      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")
      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("Dead Sea Scrolls")
      patron_3 = Patron.new("Johnny", 5)
      patron_3.add_interest("Dead Sea Scrolls")
      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)
      assert_equal [patron_1, patron_2, patron_3], dmns.patrons
      expected =  {
        gems_and_minerals => [patron_1],
        dead_sea_scrolls => [patron_1, patron_2, patron_3],
        imax => []
                  }
      assert_equal expected, dmns.patrons_by_exhibit_interest
  end
end
