class SpartanRace::CLI
  def start
    puts "Welcome to SpartanRace Gem!"
    menu
  end

  def menu
    puts "\nWould you like to race?\n"
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
      puts "\ngoodbye"
      exit
      
    else
      puts "\nplease try again"

    end
  end
  end

  def user_input
    puts "\nPlease Enter Zip to Find a Race Near you"
    input = gets.strip.to_i
    zip = valid_input(input)
    api = SpartanRace::API.new(zip)
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
    puts "\nWould you like to know more?"
    puts "Select a Race by number (1-10\n "
    input = gets.strip.to_i
    @opNum = valid_option(input)
    race_data
  end

  def valid_option(input)
    until input >= 1 && input <= 10
      puts "please try a number (1-10)"
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
    puts "\nTry again? (again) or close the app? (quit)"
  end

  def start_over
    menu 
  end

end
