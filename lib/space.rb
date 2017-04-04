class Space
  attr_reader :nickname, :name

  def initialize(name = nil)
    @name = name
    @nickname = get_nick
  end

  def get_nick
    return "." if @name.nil?
    @name[0]
  end
end