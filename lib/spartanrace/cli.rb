class SpartanRace::CLI

def call
    puts "Welcome to SpartanRace Gem!\n"
    user_input
end

def user_input
    puts "please enter zip"
    input = gets.strip.to_i
    zip = valid_input(input)
    api = SpartanRace::API.new(zip)
    api.fetch_data
end

def valid_input(input)
  until input >= 00501 && input <=99950
    puts "please enter valid zip code"
    input = gets.strip.to_i
  end
  input
end

end