class SpartanRace::Race

    attr_accessor :races, :id, :name, :start_date, :city, :state, :zip, :country_code, :country, :venue_description, :categories

    @@all = []

    def initialize(attrs)
        set_race
        attrs_from_hash(attrs)
        save
    end

    def set_race
        @set_race = @@all.length + 1
    end

    

end