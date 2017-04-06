require_relative 'timer'

class Messager
  include Timer

  attr_reader :output, :input

  def initialize(input, output)
    @input = input
    @output = output
  end

  def repeat_shot
    output.puts "You've already targeted this coordinate, shoot again!"
  end

  def miss
    system "clear"
    output.puts "You miss!"
  end

  def ai_miss
    output.puts "Computer misses!"
  end

  def hit
    system "clear"
    output.puts "You hit!"
  end

  def ai_hit
    output.puts "Computer hit!"
  end

  def sunk_ship(ship)
    output.puts "You sunk your opponents #{ship.length} size ship!"
    sleep(0.5)
  end

  def sunk_player_ship(ship)
    output.puts "Computer sunk your #{ship.length} size ship!"
    sleep(0.5)
  end

  def print_instructions
    output.puts "You have a grid from A1-D4, place a two unit ship and a three unit ship on the board.\nYour opponent will do the same.  You will take turns taking shots with your opponent, marking O for a miss and H for a hit.\nWhen a ship is fully hit, it is sunk.  When you sink all your opponents ships, you win the game!"
  end

  def print_intro
    output.puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right."
  end

  def two_unit_ship
    output.print "Enter two adjacent squares for the two-unit ship "
  end

  def three_unit_ship
    output.print "Enter three adjacent squares for the three-unit ship: "
  end

  def welcome
    system "clear"
    output.puts "Welcome to BATTLESHIP"
    output.puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def invalid
    output.print "invalid ship placement, try again: "
  end

  def invalid_shot
    output.print "invalid shot, try again: "
  end

  def play_again
    output.puts "(P)lay again or (q)uit?"
  end

  def input
    input.gets.strip.downcase
  end

  def print_player_map(board)
    output.puts "\nYour turn! Here's what you know:\n===========\n"
    print_grid(board)
    output.print "\n===========\nEnter a coordinate to shoot at:"
  end

  def print_ai_map(board)
    output.puts "\nAfter my turn, here's your map:\n===========\n"
    print_grid(board)
    output.puts ""
  end

  def print_grid(board)
    output.puts ". 1 2 3 4"
    output.print "A"
    board.values.to_a[0..3].each {|pos| @output.print " " + pos.to_s}
    output.print "\nB"
    board.values.to_a[4..7].each {|pos| @output.print " " + pos.to_s}
    output.print "\nC"
    board.values.to_a[8..11].each {|pos| @output.print " " + pos.to_s}
    output.print "\nD"
    board.values.to_a[12..15].each {|pos| @output.print " " + pos.to_s}
  end

  def win(shots=0, start, finish)
    output.puts "That was your opponents last ship!!"
    output.puts "Congratulations, you win!"
    output.puts "It took you #{shots} shots to sink your opponents ships."
    output.puts "You won in #{print_time_minutes(start, finish)} minutes and #{print_time_seconds(start, finish)} seconds."
  end

  def lose(shots=0, start, finish)
    output.puts "That was your last ship!"
    output.puts "You lose!"
    output.puts "It took your opponent #{shots} shots to sink your ships."
    output.puts "You lost in #{print_time_minutes(start, finish)} minutes and #{print_time_seconds(start, finish)} seconds."
  end
end
