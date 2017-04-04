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
end