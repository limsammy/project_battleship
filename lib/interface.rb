require 'pry'

class Interface
  def welcome
    puts 'Welcome to BATTLESHIP'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
  end

  def instructions
    puts 'Define instructions here (interface#instructions)'
  end

  def difficulties
    puts 'Choose a difficulty: (e)asy, (m)edium, or (h)ard'
  end

  def selection_error(selection)
    puts "#{selection} is not a valid response."
  end

  def self.error
    puts "Error!"
  end

  def self.starting_ship_placement(ships)
    'AI player has laid out their ships on the grid.' +
    "You now need to layout your #{ships.length} ships." +
    ships.map { |ship| "#{indent}#{ship.type} (#{ship.size} units)" }.join
  end

  def self.show_board_to_player(grid_object)
    puts "#{grid_object.type} layout:"
    puts grid_object.display_grid
    puts ""
  end

  def self.placed_player_ship(ship, grid_object)
    Interface.show_board_to_player(grid_object)
    puts "Enter desired coordinates for the bow and stern of the #{ship.type} (#{ship.size} units):"
  end

  def get_human_name
    puts "Enter your name:"
  end

  def self.coordinates_not_empty
    puts "The coordinates you entered overlap with at least one other object."
  end

  def computer_setup_complete
    puts "The AI player is finished setting up their board."
  end

end