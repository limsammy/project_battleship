require 'pry'
require_relative 'player'
require_relative 'interface'

class Battleship
  attr_reader :human, :computer

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
    input = get_input
    case input
    when 'e'
      size = 4
      ships = [ ["Destroyer",   2],
                ["Patrol",      3]]
      human_setup(size, ships)
      computer_setup(size, ships)
    when "m"
      size = 8
      ships = [ ["Destroyer",   2],
                ["Patrol",      3],
                ["Battleship",  4]]
      human_setup(size, ships)
      computer_setup(size, ships)
    when "h"
      size = 8
      ships = [ ["Destroyer",   2],
                ["Patrol",      3],
                ["Battleship",  4],
                ["Carrier",     5]]
      human_setup(size, ships)
      computer_setup(size, ships)
    else
      @interface.selection_error(selection)
      select_difficulty
    end
  end

  def human_setup(size, ships)
    @interface.get_human_name
    input = get_input
    @human = Player.new(input, false)
    @human.board_setup(size, ships)
  end

  def computer_setup(size, ships)
    @computer = Player.new("Computer", true)
    @computer.board_setup(size, ships)
    @interface.computer_setup_complete
  end
end

ship = Battleship.new
ship.start_game