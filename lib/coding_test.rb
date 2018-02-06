require_relative "./weather_record.rb"
require_relative "./team_record.rb"

module CodingTest

  def load_file(name)
    file = File.new("data/#{name}", "r")
    while (line = file.gets)
      yield(line)
    end
    file.close
  end

  def day_min_temp_spread(file_name)
    lowest = nil

    load_file file_name do |line|
      weather = WeatherRecord.new(line)

      # check for invalid weather record
      if ! weather.parsed?
        puts "invalid weather #{weather.inspect}"
        next
      end

      # check for invalid day
      if weather.day < 1 or weather.day > 31
        puts "invalid day #{weather.day}"
        next
      end

      # set first record as lowest
      if lowest.nil?
        lowest = weather
        next
      end

      # check for lowest temperature change
      if weather.temp_diff < lowest.temp_diff
        lowest = weather
      end
    end

    puts "Day #{lowest.day} has lowest temperature spread: #{lowest.temp_diff}"

    return lowest.day.to_s
  end

  def team_min_point_spread(file_name)
    teams = []

    load_file file_name do |line|
      team = TeamRecord.new line

      # check for invalid team record
      if ! team.parsed?
        puts "invalid team #{team.inspect}"
        next
      end

      # add to array if valid
      teams.push team
    end

    # sort array in place by goals for / against difference
    teams.sort! { |a, b|  a.spread <=> b.spread }
    
    # return first value
    puts "Team #{teams.first.name} has lowest point spread: #{teams.first.spread}"

    return teams.first.name
  end

end
