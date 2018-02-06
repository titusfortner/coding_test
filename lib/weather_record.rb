class WeatherRecord

  # attr_reader :Dy, :MxT, :MnT, :AvT, :HDDay, :AvDP, :_1HrP, :TPcpn, , :WxType, :PDir, :AvSp, :Dir, :MxS, :SkyC, :MxR, :MnR, :AvSLP
  attr_reader :day, :max_temp, :min_temp, :avg_temp

  def initialize(line)
    self.parse(line)
  end

  def parse(line)
    @record = line.strip.split(/\s+/)
    
    if ! parsed?
      # puts "unable to parse record: #{line}"
      return false
    end

    @day= @record[0].to_i    
    @max_temp= @record[1].to_i
    @min_temp= @record[2].to_i
    @avg_temp= @record[3].to_i
    
    #TODO: implement parsing of the rest of this with variable field count based on string index
  end

  def parsed?()
    # don't parse records with unexpected number of fields
    @record.size >= 4
  end

  def temp_diff()
    @max_temp - @min_temp
  end

end
