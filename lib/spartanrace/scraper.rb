class SpartanRace::Scraper

    attr_accessor :zip

    def initialize(zip)
        @zip = zip
    end

    def fetch_data
        url = "https://api2.spartan.com/api/races/search/?place=yes&limit=10&query=#{@zip}"
        #format :json
        response = HTTParty.get(url)
        p response.parsed_response
        #json = JSON.parse(response)
        #p response["races"]

    end



end



