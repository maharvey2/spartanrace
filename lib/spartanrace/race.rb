class SpartanRace::Race
  attr_accessor :int_id, :id, :name, :full_image_url, :start_date, :city, :state, :zip, :country_code, :country, :venue_description, :categories, :events

  @@race_info_hash = []

  def initialize(attrs)
    set_int_id
    attrs_from_hash(attrs)
    @@race_info_hash << self
  end

  def set_int_id
    @int_id = @@race_info_hash.length + 1
  end

  def self.new_from_collection(race)
    race.each do |attrs|
      new(attrs)
    end
  end

  def attrs_from_hash(attrs)
    attrs.each do |k, v|
      send("#{k}=", v)
    end
  end

  def self.all
    @@race_info_hash
  end

  def self.find_by_id(input)
    all.find { |s| s.int_id == input.to_i }
  end
end
