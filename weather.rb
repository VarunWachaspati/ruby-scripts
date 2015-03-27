#!/usr/bin/env ruby 
require "open-uri"
require "json"

puts "Enter the City(for weather updates from Weather Underground) :"
c = gets.chomp
#g = open("http://api.wunderground.com/api/24fcac72c7558671/geolookup/q/autoip.json")
#json_str = g.read
#parsed_json1 = JSON.parse(json_str)
#c = parsed_json1['location']['city']
f = open("http://api.wunderground.com/api/24fcac72c7558671/conditions/lang:EN/q/India/#{c}.json") 
  json_string = f.read
  parsed_json = JSON.parse(json_string)
  location = parsed_json['current_observation']['display_location']['full']
  observed_location = parsed_json['current_observation']['observation_location']['full']
  observation_time = parsed_json['current_observation']['observation_time_rfc822']
  humidity = parsed_json['current_observation']['relative_humidity']
  temp_c = parsed_json['current_observation']['temp_c']
  feels_like = parsed_json['current_observation']['feelslike_c']
  wind = parsed_json['current_observation']['wind_string']
  precip = parsed_json['current_observation']['precip_today_metric']
  pressure = parsed_json['current_observation']['pressure_mb']
  p_trend = parsed_json['current_observation']['pressure_trend']

  #airport = parsed_json1['location']['nearby_weather_stations']['airport']['station'][0]['city']
  print "Current temperature in #{location} is: #{temp_c} Celcius\n"
  puts "Though it feels like : #{feels_like} Celcius"
  puts "Relative Humidity : #{humidity}"
  puts "The Wind is Blowing : #{wind}"
  puts "Chances of Rain Today : #{precip}"
  puts "Pressure right now : #{pressure} and is likely to #{p_trend}"
  #puts "Nearest Airport is at : #{airport}"
  print "As observed at #{observation_time}\n"



#puts "Hello WOrld"