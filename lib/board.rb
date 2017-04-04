require_relative 'space'

class Board
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
end