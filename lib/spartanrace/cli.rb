class SpartanRace::CLI

def call
    puts "Welcome to SpartanRace Gem!\n"
    user_input
    list_races
    race_data
    #binding.pry
end

def user_input
    puts "please enter zip"
    input = gets.strip.to_i
    zip = valid_input(input)
    api = SpartanRace::Scraper.new(zip)
    api.get_races
end

def valid_input(input)
  until input >= 00501 && input <=99950
    puts "please enter valid zip code"
    input = gets.strip.to_i
  end
  input
end

def list_races
  puts "\nHere are 10 nearby races!"
  SpartanRace::Race.all.each{|s| puts "#{s.int_id}. #{s.name}"}  
end

def race_data
  puts "\nWould you like to know more?\n"
  input = gets.strip.to_i
  race = SpartanRace::Race.find_by_id(input)
  p race
  #binding.pry
end

end