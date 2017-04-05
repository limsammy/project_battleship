require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new($stdin, $stdout)
    @board.setup
  end

  def test_player_can_miss
    @ship = Ship.new('x', 2, "A1 A2")
    @test_board = @board.setup_board(4)
    @ship.set_coordinates(@test_board)

    assert_equal nil, @board.player_shoot("A3", @test_board)
  end

  def test_player_cannot_shoot_same_spot_twice

    @ship = Ship.new('x', 2, "A1 A2")
    @ship.set_coordinates(@board.ai_board)
    @board.player_shoot("A2")
    assert_equal "invalid", @board.player_shoot("A2")
  end

  def test_win_condition_starts_false
    assert_equal false, @board.someone_won?
  end

  def test_it_can_set_win_condition_to_true
    @board.win!
    assert_equal true, @board.someone_won?
  end

  def test_it_is_players_turn_by_default
    assert_equal true, @board.player_turn?
  end

  def test_it_can_set_ai_turn
    @board.turn!
    assert_equal false, @board.player_turn?
  end

  def test_it_can_swap_turns
    @board.turn!
    @board.turn!
    assert_equal true, @board.player_turn?
  end
end