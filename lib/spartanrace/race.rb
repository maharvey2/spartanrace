class SpartanRace::Race
    attr_accessor :race, :name, :start_date, :city, :date, :venue_description

    @@all =[]

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

end
