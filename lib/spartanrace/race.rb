# frozen_string_literal: true

class SpartanRace::Race
  attr_accessor :int_id, :id, :name, :full_image_url, :start_date, :city, :state, :zip, :country_code, :country, :venue_description, :categories, :events

  @@all = []

  def initialize(attrs)
    set_int_id
    attrs_from_hash(attrs)
    save
  end

  def set_int_id
    @int_id = @@all.length + 1
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

  def self.fetch_data
    SpartanRace::API.get_races
    all
  end

  def self.all
    fetch_data if @@all == []
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_id(input)
    all.find { |s| s.int_id == input.to_i }
  end
end
