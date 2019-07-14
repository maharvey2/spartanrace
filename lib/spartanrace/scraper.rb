class SpartanRace::Scraper
    require 'nokogiri'
    require 'httparty'

    attr_accessor :zip

    def initialize(zip)
        @zip = zip
    end

    def fetch_data
        url = "https://api2.spartan.com/api/races/search/?place=yes&limit=1&query=#{@zip}"
        unparesed_page = HTTParty.get(url)
        binding.pry
    end

    

end



