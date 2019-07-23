class SpartanRace::Scraper

    attr_accessor :zip

    def initialize(zip)
        @zip = zip
    end

    def get_races
        url = "https://api2.spartan.com/api/races/search/?place=yes&limit=13&query=#{@zip}"
        #format :json
        response = HTTParty.get(url)
        #p response.parsed_response
        #json = JSON.parse(response)
        race = response["races"]
        SpartanRace::Race.new_from_collection(race)
    end
end



