require 'spec_helper'

describe CodingTest do
  it 'shows the day number with the smallest temperature spread' do
    expect(day_min_temp_spread('data.dat')).to be == '14'
  end

  it 'shows the name of the team with the smallest difference' do
    expect(team_min_point_spread('football.dat')).to be == 'Aston_Villa'
  end
end
