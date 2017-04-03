require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleShipTest < Minitest::Test
  def test_game_object_instantiates
    g = Battleship.new

    assert_instance_of Game, g
  end
end