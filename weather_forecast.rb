# Don't forget to require the gem(s) (if not in Rails)
require 'httparty'

class WeatherForecast

  attr_accessor :options, :response

  # Including their module so we have access to
  # their helper methods
  include HTTParty

   # This is a convenience method for
  # HTTParty::ClassMethods.base_uri
  base_uri 'api.openweathermap.org'
  API_KEY = ENV["API_KEY"]

  # api.openweathermap.org/data/2.5/forecast?q={city name},{country code&cnt{cnt}}

  # Provide the initial setup information for the HTTP wrapper
  # In this case, we're building an options object that contains
  # the query string parameters we'll need to submit
  def initialize(city_id=2643743, no_of_days=5)
    @options = { :query => { :id => city_id, :cnt => no_of_days, :APPID => API_KEY}}
  end

  # Actually run the request using their `get` convenience method
  def questions
    @response = self.class.get("/data/2.5/forecast", @options)
  end


  def hi_temps
    temps = @response.parsed_response
    temps["list"].each_with_index do |day, i|
      puts "Day #{i} maximum temp is #{day["main"]["temp_max"]}"
    end
  end 

  def lo_temps
    temps = @response.parsed_response
    temps["list"].each_with_index do |day, i|
      puts "Day item #{i} minimum temp is #{day["main"]["temp_min"]}"
    end
  end 

  def today
    temps = @response.parsed_response
    temps["list"].each_with_index do |day, i|
      puts "Day Item #{i} temp is #{day["main"]["temp"]}"
    end
  end

  def tomorrow
    temps = @response.parsed_response
    temps["list"].each_with_index do |day, i|
      puts "Day Item #{i} temp is #{day["main"]["temp"]}"
    end
  end

  def humidity
    humids = @response.parsed_response
    humids["list"].each_with_index do |day, i|
      puts "Day item #{i} temp is #{day["main"]["humidity"]}"
    end
  end

   

  def pressure
    pressure_reads = @response.parsed_response
    pressure_reads["list"].each_with_index do |day, i|
      puts "Day item #{i} temp is #{day["main"]["pressure"]}"
    end
  end

  def sea_level
    sea_level_reads = @response.parsed_response
    sea_level_reads["list"].each_with_index do |day, i|
      puts "Day item #{i} temp is #{day["main"]["sea_level"]}"
    end
  end

end