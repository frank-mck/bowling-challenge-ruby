
class Scoreboard
  attr_reader :frame_score, :frame_num, :roll_number, :total_score, :knocked_down_pins

  def initialize
    @frame_num = 1
    @frame_score = 0
    @roll_number = 1
    @total_score = 0
    @knocked_down_pins = []
  end

  def add_roll
    if @roll_number > 2
      @roll_number = 1
      @frame_num += 1
      add_roll
    elsif @frame_num == 10
      end_game
    else
      @knocked_down_pins << get_players_score
    end
  end

  private

  def get_players_score
    puts 'enter knocked down pins'
    user_input = gets.chomp.to_i
    @roll_number += 1
    @frame_score += user_input
    return user_input
  end

  def end_game
    puts 'end of game'
  end

end
