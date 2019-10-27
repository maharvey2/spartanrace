class SpartanRace::CLI
  def start
    puts "Welcome to SpartanRace Gem!\n"
    user_input
    menu
  end

  def menu
    list_races
    race_data
    start_over
  end

  def user_input
    puts 'Please Enter Zip to Find a Race Near you'
    input = gets.strip.to_i
    zip = valid_input(input)
    api = SpartanRace::Scraper.new(zip)
    api.get_races
  end

  def valid_input(input)
    until input >= 0o0501 && input <= 99_950
      puts 'please enter valid zip code'
      input = gets.strip.to_i
    end
    input
  end

  def list_races
    puts "\nHere are nearby races!"
    SpartanRace::Race.all.each { |sr| puts "#{sr.int_id}. #{sr.name}. #{sr.state}." }
    puts "\nWould you like to know more?"
    puts "Select a Race by number or 'quit' to leave\n "
    @option = gets.strip.to_i
  end

  def race_data
    individual_race = SpartanRace::Race.find_by_id(@option)
    puts individual_race.name
    puts individual_race.city
    puts individual_race.state
    puts individual_race.start_date
    puts individual_race.venue_description
  end

  def start_over
    menu 
  end

end
