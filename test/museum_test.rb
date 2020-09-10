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
end
