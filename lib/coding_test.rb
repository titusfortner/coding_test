require_relative "./weather_record.rb"
require_relative "./team_record.rb"

module CodingTest

    # Feel free to use, ignore or modify this code as you see fit
  def load_file(name)
    file = File.new("data/#{name}", "r")
    while (line = file.gets)
      yield(line)
    end
    file.close
  end


  def day_min_temp_spread(file_name)
    # puts "get temp data from " + file_name

    lowest = nil

    load_file file_name do |line|
      weather = WeatherRecord.new(line)

      # check for invalid weather record
      if ! weather.parsed?
        next
      end

      # check for invalid day
      if weather.day < 1 or weather.day > 31
        next
      end

      if lowest == nil
        lowest = weather
      end

      if weather.temp_diff < lowest.temp_diff
        lowest = weather
      end
    end

    puts "Day #{lowest.day} has lowest temperature spread: #{lowest.temp_diff}"

    return lowest.day.to_s
  end



  def team_min_point_spread(file_name)
    # puts "get point spread from " + file_name

    teams = []

    load_file file_name do |line|
      team = TeamRecord.new line

      # check for invalid team record
      if ! team.parsed?
        puts "invalid team #{team.inspect}"
        next
      end

      teams.push team
      
    end

    teams.sort! { |a, b|  a.spread <=> b.spread }
    
    puts "#{teams.first.name} has lowest point spread: #{teams.first.spread}"

    return teams.first.name
  end

end
