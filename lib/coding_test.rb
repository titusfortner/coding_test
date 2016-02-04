require_relative 'page_object'
require 'watir-webdriver'

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
    fail "Implement this method"
  end

  def team_min_point_spread(file_name)
    fail "Implement this method"
  end

  def create_browser
    fail "Implement this method"
  end
end
