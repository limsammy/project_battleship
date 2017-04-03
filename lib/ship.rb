class Ship
  def initialize(type, size, coordinates = nil)
    @type = type
    @size = size
    @coordinates = coordinates
    @hits = hits
    @sunk = false
  end
end