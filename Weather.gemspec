require 'nokogiri'
require 'open-uri'
require 'json'

puts "Enter a city name:"
city = gets.chomp

# Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key
api_key = 'YOUR_API_KEY'

# Construct the API URL
url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}"

# Fetch data from the API
response = URI.open(url)
data = JSON.parse(response.read)

# Parse the retrieved data and display relevant information
if data['cod'] == 200
  description = data['weather'][0]['description']
  temperature_kelvin = data['main']['temp']
  temperature_celsius = temperature_kelvin - 273.15  # Convert from Kelvin to Celsius
  humidity = data['main']['humidity']
  # Accessing wind information
  wind_speed = data['wind']['speed']
  wind_direction = data['wind']['deg']

  # Accessing visibility
  visibility = data['visibility']

  # Accessing pressure
  pressure = data['main']['pressure']

  # Accessing sunrise and sunset times
  sunrise_time = Time.at(data['sys']['sunrise']).strftime('%I:%M:%S %p')
  sunset_time = Time.at(data['sys']['sunset']).strftime('%I:%M:%S %p')

  # Accessing weather icons
  icon = data['weather'][0]['icon']
  # You can use this icon code to fetch an image representing the weather condition

  # Accessing UV index
  uv_index = data['uvindex']

  # Accessing moon phase
  moon_phase = data['moon_phase']

  # Accessing precipitation data
  precipitation = data['precipitation']

  # Accessing air quality index
  aqi = data['aqi']
  puts "Weather in #{city}: #{description}"
  puts "Temperature: #{temperature_celsius.round(2)}°C"  # Round the temperature to two decimal places
  puts "Humidity: #{humidity}%"
  puts "Wind speed: #{wind_speed} kmh"
  puts "Wind direction: #{wind_direction}"
  puts "Visibility: #{visibility}"
  puts "Pressure: #{pressure}"
  puts "Sunrise: #{sunrise_time}"
  puts "Susnet: #{sunset_time}"
else
  puts "Weather data not available for #{city}"
end
