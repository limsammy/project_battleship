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

  def test_create_board
    board = Board.new(4, "Board 1", false)

    board_test = board.setup_grid

    assert_equal 4,   board_test.length
    assert_equal 4,   board_test[0].length
    assert_equal Space, board_test[rand(0..3)][rand(0..3)].class
  end

  def test_board_can_be_created_automatically
    board = Board.new(4, "Board 1", false)

    assert_equal 4,   board.grid.length
    assert_equal 4,   board.grid[0].length
    assert_equal Space, board.grid[rand(0..3)][rand(0..3)].class
  end

  def test_outline
    board = Board.new(4, "Board 1", false)

    line = "=" * 12

    assert_equal line, board.outline
  end

  def test_column_labels
    board = Board.new(4, "Board 1", false)

    labels = "   A B C D"

    assert_equal labels, board.column_labels
  end

  def test_board_values
    board = Board.new(4, "Board 1", false)
    vals = " ." * 4

    assert_equal vals, board.display_values(1)
  end

  def test_display_board_values_empty
    board = Board.new(6, "Board 1", false)
    vals = " . . . . . ."

    assert_equal vals, board.display_values(1)
  end
end