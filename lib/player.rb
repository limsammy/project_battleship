require './lib/board'

class Player
  def initialize(name, player_is_ai)
    @name = name
    @ai = player_is_ai
  end

  def board_setup(size, ships)
    @main_board = Board.new(size, "Main Board", @ai)
    @main_board.get_ships(ships)
    @main_board.place_ships
    @validation_board = Board.new(size, "Validation Board", @ai)
  end

  def display_boards
    @validation_board.display_grid
    @main_board.display_grid
  end
end