class SpartanRace::API

    def initialize(zip)
        @zip = zip
    end

    def fetch_data
        url = "https://api2.spartan.com/api/races/search/?place=yes&limit=200&query=#{@zip}"
        response = HTTParty.get(url)

    end
  
end




#p response.body
#p response.code
#p response.message
#p response.headers.inspect
#response = HTTParty.get('https://api2.spartan.com/api/races/search/')