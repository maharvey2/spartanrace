class SpartanRace::Race

    attr_accessor :races, :id, :name, :start_date, :city, :state, :zip, :country_code, :country, :venue_description, :categories

    @@all = []

    def initialize(attrs)
        set_int_id
        attrs_from_hash(attrs)
        save
    end

    def set_int_id
        @set_race = @@all.length + 1
    end

    def self.new_from_collection(races)
        races.each do |attrs|
            new(attrs)
    end
end

    def attrs_from_hash(attrs)
        attrs.each do |k, v|
            send("#{k}=" , v)
    end
end

    def self.get_races
        SpartanRace::API.get_races
        all
    end

    def save
        @@all << self
    end

    def self.find_by_id(input)
        all.find{|s| s.int_id == input.to_i}
    end





    #end for the class
end