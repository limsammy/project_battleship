require_relative 'space'

class Board
  attr_reader :size, :type, :grid, :ships

  def initialize(size, type, ai)
    @ai = ai
    @type = type
    @size = size
    @grid = setup_grid
    @ships = []
  end

  def setup_grid
    Array.new(@size) { Array.new(@size) { Space.new } }
  end

  def get_ships(ships)
    ships.each do |name, size, coordinates|
      @ships.push(Ship.new(name, size, coordinates))
    end
  end

  def get_coordinates(ship)
    if ship.coordinates.nil?
      generator = CoordGen.new(@size)
    else
      generator = CoordGen.new(@size, ship.coordinates)
    end

    if @ai
      generator.calc_ship_coordinates(ship.size)
    else
      Interface.placed_player_ship(ship, self)
      generator.calc_ship_coordinates(ship.size)
    end

    if empty_coordinates?(generator.coordinates)
      generator.coordinates
    else
      ship.coordinates = nil
      false
    end
  end

  def empty_coordinates?(coordinates)
    return false unless coordinates
    return false if coordinates.class == String
    coordinates.each do |x, y|
      unless @grid[x][y].nickname == "."
        Interface.coordinates_not_empty
        return false
      end
    end
    true
  end

  def place_object(object, coordinates)
    coordinates.each { |x, y| @grid[x][y] = object }
  end

  def place_ships
    @ships.each do |ship|
      coordinates = get_coordinates(ship)
      until coordinates
        coordinates = get_coordinates(ship)
      end
      place_object(ship, coordinates)
    end
    Interface.show_board_to_player(self) unless @ai
  end

  def display_grid
    display_grid =
      [ outline,
        column_labels,
        row_labels_and_values,
        outline
      ]
    display_grid.flatten.join("\n")
  end

  def outline
    "=" * ((self.size * 2) + 4)
  end

  def column_labels
    "  " + (1..self.size).map { |i| " #{(i+64).chr}" }.join
  end

  def row_labels_and_values
    (1..self.size).map { |i| i.to_s.rjust(2) + display_values(i-1) }
  end

  def display_values(r)
    self.grid[r].map { |c| " #{c.nickname}" }.join
  end
end