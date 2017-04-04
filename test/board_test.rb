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
    board = Board.new(4, "Board 1", false)

    assert          board
    assert_equal 4, board.size
  end

  def test_create_grid
    board = Board.new(4, "Board 1", false)

    board_test = board.setup_grid

    assert_equal 4,   board_test.length
    assert_equal 4,   board_test[0].length
    assert_equal Space, board_test[rand(0..3)][rand(0..3)].class
  end

  def test_grid_can_be_created_automatically
    board = Board.new(4, "Board 1", false)

    assert_equal 4,   board.grid.length
    assert_equal 4,   board.grid[0].length
    assert_equal Space, board.grid[rand(0..3)][rand(0..3)].class
  end
end