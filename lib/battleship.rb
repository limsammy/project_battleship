require 'pry'

class BattleShip
  def initialize
    @message = Message.new
  end

  def get_input
    gets.chomp.downcase
  end

  def start_game
    @message.welcome
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

  def show_instructions
    @message.instructions
    start_game
  end
end