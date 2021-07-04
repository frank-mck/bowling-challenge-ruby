
class Scoreboard
  attr_reader :frame_score, :frame_num, :roll_number, :total_score, :scores

  def initialize
    @frame_num = 1
    @frame_score = 0
    @roll_number = 1
    @total_score = 0
    @scores = []
  end

  def add_roll
    if @roll_number > 2
      @roll_number = 1
      @frame_num += 1
      add_roll
    else
      @scores << get_players_score
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

end
