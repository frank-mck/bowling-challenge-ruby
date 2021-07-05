require './lib/scoreboard'

describe Scoreboard do
  it 'lets a user add a roll to the knocked down pins score sheet' do
      scoreboard = Scoreboard.new
      allow_any_instance_of(Scoreboard).to receive(:gets).and_return('7')
      expect(Scoreboard.new.add_roll).to eq([7])
    end

    it 'user scores a perfect score' do
      scoreboard = Scoreboard.new
      allow_any_instance_of(Scoreboard).to receive(:gets).and_return('10') 
      24.times { scoreboard.add_roll }
      expect(scoreboard.frame_score).to eq(300)
    end
  end
