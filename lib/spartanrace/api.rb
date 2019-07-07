#class SpartanRace::API
# start of API pull with httparty
#require 'httparty'
#currently it is set to a zip, have to figure out how to change that 
response = HTTParty.get('https://api2.spartan.com/api/races/search/?place=yes&limit=200&query=35401')

puts response.body
#puts response.code
#puts response.message
#puts response.headers.inspect
#races = response["location"]
