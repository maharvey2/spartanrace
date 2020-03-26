# frozen_string_literal: true

class SpartanRace::API
  attr_accessor :zip

  def initialize(zip)
    @zip = zip
  end

  def get_races
    url = "https://api2.spartan.com/api/races/search/?place=yes&limit=10&query=#{@zip}"
    response = HTTParty.get(url)
    race = response['races']
 #   race.each do |run|
#      race_object = Race.new
SpartanRace::Race.new_from_collection(race)
  end
end