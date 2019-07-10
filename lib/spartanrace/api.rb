require 'rubygems'
require 'httparty'

class SpartanRace::API
    include HTTParty
    base_uri 'https://api2.spartan.com/api/races/search/'

    response = HTTParty.get('https://api2.spartan.com/api/races/search/')

    puts response.body


end