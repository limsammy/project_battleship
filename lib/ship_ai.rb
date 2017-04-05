module AI

  def ai_shoot(ship)
    coordinate = @player_board.keys.sample
    ai_check_board(ship, coordinate)
  end

  def ai_hit_sequence(ship, coordinate)
    ship.each do |ship|
      if ship.location.split.include?(coordinate)
        @messager.ai_hit
        hit_ship(ship)
        if ship.hits == 0
          @messager.sunk_player_ship(ship)
          ship.delete(ship)
          if ship.size == 0
            end_game_lose
          end
        end
      end
    end
  end

  def ai_check_board(ship, coordinate)
    if @player_board[coordinate] == 'x' || @player_board[coordinate] == 'y'
      @player_board[coordinate] = 'H'
      @ai_shot_counter += 1
      ai_hit_sequence(ship, coordinate)
    elsif @player_board[coordinate] == nil
      @player_board[coordinate] = 'O'
      @ai_shot_counter += 1
      @messager.ai_miss
    elsif @player_board[coordinate] == 'O'
      ai_shoot(ship)
    end
  end

  def randomize_ai_board
    @ai_ship_one = Ship.new('x', 2)
    ship_a_first_position = @ai_board.keys.sample
    @ai_ship_one.set_individual_coordinate(@ai_board, ship_a_first_position)
    ship_a_next_position = get_next_position(ship_a_first_position)
    @ai_ship_one.set_individual_coordinate(@ai_board, ship_a_next_position)
    ship_a_coordinates = "#{ship_a_first_position} #{ship_a_next_position}"
    @ai_ship_one.location = ship_a_coordinates
    @ai_ship << @ai_ship_one
    @ai_ship_two = Ship.new('y', 3)
    ship_b_first_position = find_third_start
    @ai_ship_two.set_individual_coordinate(@ai_board, ship_b_first_position)
    ship_b_second_position = get_next_position(ship_b_first_position)
    @ai_ship_two.set_individual_coordinate(@ai_board, ship_b_second_position)
    ship_b_third_position = get_next_position(ship_b_second_position)
    @ai_ship_two.set_individual_coordinate(@ai_board, ship_b_third_position)
    ship_b_coordinates = "#{ship_b_first_position} #{ship_b_second_position} #{ship_b_third_position}"
    @ai_ship_two.location = ship_b_coordinates
    @ai_ship << @ai_ship_two
  end

  def find_third_start
    third_ship_start = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2', 'D1', 'D2']
    location = third_ship_start.sample
    if @ai_board[location] != nil
      find_third_start
    else
      return location
    end
  end

  def get_next_position(first_position)
    if first_position.split('')[1].succ.to_i >= 5 || @ai_board[first_position.succ] != nil
      get_previous_position(first_position)
    else
      first_position.succ
    end
  end

  def get_position_below(first_position)
    if first_position.split('').rotate.join.succ.split('').rotate[0] >= 'E' || @ai_board[first_position.split('').rotate.join.succ.split('').rotate.join] != nil
      get_position_above(first_position)
    else
      first_position.split('').rotate.join.succ.split('').rotate.join
    end
  end

  def get_previous_position(first_position)
    previous_index = @ai_board.keys.index(first_position) - 1
    if previous_index < 0 || @ai_board[@ai_board.keys[previous_index]] != nil
      get_position_below(first_position)
    else
      @ai_board.keys[previous_index]
    end
  end

  def get_position_above(first_position)
    previous_index = @ai_board.keys.index(first_position) - 4
    if previous_index > 0
      @ai_board.keys[previous_index]
    end
  end
end
