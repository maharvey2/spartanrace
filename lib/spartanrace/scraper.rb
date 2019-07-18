class SpartanRace::Scraper

    attr_accessor :zip

    def initialize(zip)
        @zip = zip
    end

    def self.fetch_data
        url = "https://api2.spartan.com/api/races/search/?place=yes&limit=1&query=#{@zip}"
        #format :json
        response = HTTParty.get(url)
        #json = JSON.parse(response.body)
        #binding.pry
        race_data = response.body
        SpartanRace::Race.new_from_collection
    end



end



