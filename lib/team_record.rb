class TeamRecord

  attr_reader :name, :games_played, :wins, :losses, :draws, :goals_for, :goals_against, :points

  def initialize(record)
    self.parse(record)
  end

  def parse(line)
    @record = line.strip.split(/\s+/)
    
    if ! parsed?
      puts "unable to parse record: #{line}"
      return
    end

    @name = @record[1]
    @games_played = @record[2].to_i
    @wins = @record[3].to_i
    @losses = @record[4].to_i
    @draws = @record[5].to_i
    @goals_for = @record[6].to_i
    @goals_against = @record[8].to_i
    @points = @record[9].to_i
  end

  def spread()
    (@goals_for - @goals_against).abs
  end

  def parsed?()
    # don't parse records with unexpected number of fields
    if @record.size != 10
      return false
    end

    return true
  end

end
