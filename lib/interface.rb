require 'pry'

class Interface
  def welcome
    puts 'Welcome to BATTLESHIP'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    print '>'
  end

  def instructions
    puts 'Define instructions here (interface#instructions)'
  end

  def difficulties
    puts 'Choose a difficulty: (e)asy, (m)edium, or (h)ard'
  end
end