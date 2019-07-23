class SpartanRace::Scraper

    attr_accessor :zip

    def initialize(zip)
        @zip = zip
    end

    def get_races
        url = "https://api2.spartan.com/api/races/search/?place=yes&limit=10&query=#{@zip}"
        #format :json
        response = HTTParty.get(url)
        #p response.parsed_response
        #json = JSON.parse(response)
        #p response["races"]
        #parsed_response = JSON.parse(response&.body || "{}")
    end

    def race_data
        binding.pry
    end

end



