
class Scoreboard
  attr_reader :frame_score, :frame_num, :roll_num, :total_score, :knocked_down_pins, :score_after_frame

  def initialize
    @frame_num = 1
    @frame_score = 0
    @roll_num = 1
    @total_score = 0
    @score_after_frame = []
    @knocked_down_pins = []
  end

  def add_roll
    if @roll_num >= 3 && @frame_score < 10 
      update_roll_and_frame_num
      frame_score
      add_roll
    elsif @frame_num == 10
      end_game
    elsif @frame_score == 10
      get_players_score
    else
      @knocked_down_pins << get_players_score
    end
  end

  private

  def get_players_score
    @user_input = 0
    puts 'enter knocked down pins'
    @user_input = gets.chomp.to_i
    @roll_num += 1
    @frame_score += @user_input
    return @user_input
  end

  def frame_score
    @score_after_frame << @frame_score
    @total_score += @frame_score
    @frame_score = 0
  end

  def end_game
    puts 'end of game'
  end

  def update_roll_and_frame_num
    @roll_num = 1
    @frame_num += 1
  end

  def check_for_strike
    if @roll_num == 1 && @user_input == 10
      @total_score += add_strike_bonus
    end
  end

  def add_strike_bonus
    if @roll_num == 1 && @user_input == 10
      get_players_score + get_players_score
    end
    return @knocked_down_pins[-1] + @knocked_down_pins[-2]
  end

  def add_spare_bonus
      puts 'enter knocked down pins'
      @user_input = gets.chomp.to_i
      @knocked_down_pins << @user_input
      @roll_num += 1
  end

  def spare_bonus_checker?
    @knocked_down_pins[-2] + @knocked_down_pins[-3] == 10
  end

end
