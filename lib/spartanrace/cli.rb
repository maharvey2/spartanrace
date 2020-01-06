class SpartanRace::CLI
  def start
    puts "Welcome to SpartanRace Gem!\n"
    #user_input
    menu
  end

  def menu
    puts "Would you to race?\n"
    puts "yes or no?"

  input = ""

  while input != "no"
    
    input = gets.strip

    case input
    when "yes"
      user_input

    when "again"
    list_races
    
    when "no"
      puts "\ngoodbye"
      exit

    when "quit"
      puts "goodbye"
      exit
      
    else
      puts "please try again"

    end
  end
  end

  def user_input
    puts 'Please Enter Zip to Find a Race Near you'
    input = gets.strip.to_i
    zip = valid_input(input)
    api = SpartanRace::Scraper.new(zip)
    api.get_races
    list_races
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
    get_option
  end

  def get_option
    input = gets.strip.to_i
    puts "\nWould you like to know more?"
    puts "Select a Race by number or 'quit' to leave\n "
    @opNum = valid_option(input)
    race_data
  end

  def valid_option(input)
    until input >= 1 && input <= 10
      puts "Nope"
      input = gets.strip.to_i
  end
  input
end

  def race_data
    individual_race = SpartanRace::Race.find_by_id(@opNum)
    puts "\n#{individual_race.name}"
    puts "#{individual_race.city}"
    puts "#{individual_race.state}"
    puts "#{individual_race.start_date}"
    puts "#{individual_race.venue_description.gsub!(/<\/?[^>]*>/, "")}"
    puts "\ntry again? (again)"
  end

  def start_over
    menu 
  end

end
