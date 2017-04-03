require 'pry'
require_relative 'interface'

class Battleship
  def initialize
    @interface = Interface.new
  end

  def get_input
    gets.chomp.downcase
  end

  def start_game
    @interface.welcome
    game_menu_choice
  end

  def game_menu_choice
    input = get_input
    case input
    when 'p'
      choose_difficulty
    when 'i'
      show_instructions
    when 'q'
      abort('Quitting...')
    end
  end

  def show_instructions
    @interface.instructions
    start_game
  end

  def choose_difficulty
    @interface.difficulties
  end
end

# ship = Battleship.new
# ship.start_game