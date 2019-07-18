class SpartanRace::Race
    attr_accessor :race, :name

    @@all =[]

    def initialize(attrs)
        attrs_from_hash(attrs)
        save
    end

    def self.new_from_collection(unparesed_page)
        unparesed_page.each do |attrs|
            new(attrs)
    end
end

    def attrs_from_hash(attrs)
        attrs.each do |k, v|
            send("#{k}=", v)
        end
    end

    def self.fetch_data
        SpartanRace::Scraper.fetch_data
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