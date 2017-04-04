class Ship
  attr_reader   :abbv, :coordinates, :name, :size
  attr_accessor :coordinates

  def initialize(type, size, coordinates = nil)
    @type = type
    @size = size
    @coordinates = coordinates
    @hits = hits
    @sunk = false
  end
end