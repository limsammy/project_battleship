require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_game_object_instantiates
    g = Battleship.new

    assert_instance_of Battleship, g
  end
end