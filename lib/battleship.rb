require_relative 'board'
require_relative 'messager'
require_relative 'player'

class Battleship
  include Player

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @input = input
    @output = output
  end

  def start_game
    @messager.welcome
    choice ||= get_menu_option
    if choice == 'q'
      @output.puts "Thanks for playing."
      return 0
    elsif choice == 'i'
      @messager.print_instructions
      run_game
    elsif choice == 'p'
      play_game
      return 0
    end
  end

  def play_game
    @new_game = Board.new(@input, @output)
    @p_ship = []
    @valid_choices = @new_game.setup_board(4).keys
    @new_game.setup
    @new_game.randomize_ai_board
    @messager.print_intro
    @messager.two_unit_ship
    place_two_unit_ship
    @messager.three_unit_ship
    place_three_unit_ship

    while !@new_game.someone_won?
      if @new_game.player_turn?
        @new_game.print_player_map
        if player_shoot == "invalid"
          player_shoot
        end
        @new_game.turn!
        sleep(0.5)
      else
        ai_shoot
        @new_game.print_ai_map
        @new_game.turn!
        sleep(0.5)
      end
    end
    play_again
  end

  def play_again
    @messager.play_again
    choice = get_menu_option
    if choice == 'p'
      play_game
    else
      return 0
    end
  end

  def player_shoot
    shot = placement_input
    if @valid_choices.include?(shot)
      @new_game.player_shoot(shot)
    else
      @messager.invalid_shot
      return "invalid"
    end
  end

  def ai_shoot
    @new_game.ai_shoot(@p_ship)
  end

  def get_menu_option
    @input.gets.strip.downcase[0]
  end

  def placement_input
    @input.gets.strip.upcase
  end
end
