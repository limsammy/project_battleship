class Ship
  attr_reader   :abbv, :coordinates, :type, :size, :nickname
  attr_accessor :coordinates

  def initialize(type, size, coordinates = nil)
    @type = type
    @size = size
    @coordinates = coordinates
    @hits = 0
    @sunk = false
    @nickname = type[0]
  end
end