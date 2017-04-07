module Player
  def player_shoot(coordinate, board=@ai_board)
    @player_shot_counter += 1
    if board[coordinate] == 'x' || board[coordinate] == 'y'
      board[coordinate] = 'H'
      @displayed_ai_board[coordinate] = 'H'
      hit_sequence(coordinate)
    elsif board[coordinate] == nil
      board[coordinate] = 'O'
      @displayed_ai_board[coordinate] = 'O'
      @messager.miss
    elsif board[coordinate] == 'O' || board[coordinate] == 'H'
      @messager.repeat_shot
      return "invalid"
    end
  end

  def hit_ship(ship)
    ship.hit
  end

  def hit_sequence(coordinate)
    @ai_ship.each do |ship|
      if ship.location.split.include?(coordinate)
        @messager.hit
        hit_ship(ship)
        if ship.hits == 0
          @messager.sunk_ship(ship)
          @ai_ship.delete(ship)
          if @ai_ship.size == 0
            end_game_win
          end
        end
      end
    end
  end
end
