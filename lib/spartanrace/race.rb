class SpartanRace::Race
    attr_accessor :Race

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



end