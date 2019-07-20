#begin 
class SpartanRace::Race
    attr_accessor :races, :name, :start_date, :city, :zip, :venue_description

    @@all =[]

    def initialize(race_hash)
        @races = []
        @name = name
        @start_date = start_date
        @city = city
        save
    end

    def self.all
        SpartanRace::Scraper.fetch_data if @@all.empty?
        @@all
    end

    def get_races
        SpartanRace::Scraper.fetch_data(self) if @races.empty?
    end

    def save
        @@all << self
    end
end
#end




=begin
def initialize(attrs)
        attrs_from_hash(attrs)
        save
    end

    def self.new_from_collection(response)
        fetch_data.each do |attrs|
            new(attrs)
    end
end

    def attrs_from_hash(attrs)
        attrs.each do |k, v|
            send("#{k}=", v)
        end
    end

    def self.fetch_data
        SpartanRace::Scraper.self.fetch_data
        all
    end

    def self.all
        fetch_data if @@all == []
        @@all
    end

    def save
        @@all << self
    end
=end