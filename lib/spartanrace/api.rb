class SpartanRace::API
# start of API pull with httparty
#require 'httparty'
#currently it is set to a zip, have to figure out how to change that 

def get_race
response = HTTParty.get('https://api2.spartan.com/api/races/search/?place=yes&limit=200&query=35401', format: :plain)
body = JSON.parse(response.body)
id = body["id"]

#puts response.body
#puts response.code
#puts response.message
#puts response.headers.inspect
#races = response["location"]
    end
end
