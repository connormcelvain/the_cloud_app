class WeatherController < ApplicationController
  
  def index
    if params['location']
      begin
        @response = Faraday.get 'https://api.openweathermap.org/data/2.5/weather?q=' + (params['location']) + '&appid=' + 'API_KEY'
        @parse = JSON.parse(@response.body)
        @location = @parse["name"]
        @weather = @parse["weather"][0]["description"]
        @weather_icon = 'http://openweathermap.org/img/wn/' + @parse["weather"][0]["icon"] + '@2x.png'
      rescue StandardError
        @error = "Location not found!"
      end
    end
  end
end