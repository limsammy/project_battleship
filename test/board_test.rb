require 'simplecov'
SimpleCov.start
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'
require './lib/space'

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new(4, "Main Board", false)

    assert          board
    assert_equal 4, board.size
  end

  def test_create_grid
    board = Board.new(4, "Main Board", false)

    board_test = board.setup_grid

    assert_equal 4,   board_test.length
    assert_equal 4,   board_test[0].length
    assert_equal Space, board_test[rand(0..3)][rand(0..3)].class
  end
end