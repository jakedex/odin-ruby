class Game
  def initialize
    #randomly select from read in words
    @secret_word = read_in_word

    #setup pregame variables
    @incorrect_guesses = ""
    @guesses = "".rjust(@secret_word.length, "_")
  end

  # return word with length [5,12] read in from the dictionary.txt file
  def read_in_word
    # File.open("dictionary.txt", "r") do |line|
    #   line.read.split("\r\n").each {|word| words << word if word.length.between?(5,12)}
    # end
    begin
		  File.readlines("dictionary.txt").
		     select { |word| word.length.between?(5, 12) }.sample.chomp
		rescue
			puts "Unable to read from file."
			nil
    end
  end

  # handle win/loss detection
  def check_winloss
    if @secret_word == @guesses
      puts "You won! The word was #{@secret_word}."
      exit
    elsif @incorrect_guesses.length >= 8
      puts "You lost :( The word was #{@secret_word}."
      exit
    end
  end

  # gather input validated player guess
  def get_guess
    print "Enter guess: "
    loop do
      guess = gets.chomp.downcase
      guess == "save" ? save_game : guess = guess[0]

      if (!@incorrect_guesses.include? guess) && (!@guesses.include? guess)
        return guess
      end
      print "You've already guessed that letter, try again: "
    end
  end

  #if correct, change guesses_string
  #incorrect, add the incorrect_guesses
  def handle_guess guess
    if @secret_word.include? guess
      @secret_word.length.times do |index|
        if @secret_word[index] == guess
          @guesses[index] = guess
        end
      end
      puts "Correct guess!"
    else
      @incorrect_guesses << guess
      puts "Incorrect guess :("
    end
  end

  # save game to data/save.yaml and exit
  def save_game
    Dir.mkdir("data") unless Dir.exist? "data"

    filename = "data/save.yaml"

    File.open(filename,'w') do |file|
      game_data = [@secret_word, @guesses, @incorrect_guesses]
      file.puts YAML::dump(game_data)
    end

    puts "\nGame saved."
    exit
  end

  # If saved file exists, load it
  def load_game
    if File.exist?("data/save.yaml")
      loaded_game = YAML.load_file("data/save.yaml")
      @secret_word = loaded_game[0]
      @guesses = loaded_game[1]
      @incorrect_guesses = loaded_game[2]

      time = File.mtime("data/save.yaml")
      puts "\n#{time.month}/#{time.day} #{time.hour}:#{time.min} game loaded.\n\n"

      play
    else
      puts "\nSave file not found.\n\n"
    end
  end

  # If saved file exists, delete it
  def delete_save
     if File.exist?("data/save.yaml")
       File.delete("data/save.yaml")
       puts "\nSave file deleted\n\n"
     else
       puts "\nNo save file to delete\n\n"
     end
  end

  def turn
    #print game progress
    puts "\nIncorrect guesses: " + @incorrect_guesses
    puts "Guesses left: #{8 - @incorrect_guesses.length}"
    puts @guesses

    #gather input and validate
    guess = get_guess

    #manipulate guesses strings
    handle_guess guess

    #check win/loss
    check_winloss
  end

  def start
    puts "Welcome to Hangman, would you like to:"

    loop do
      puts "1. Play Hangman"
      puts "2. Load saved game"
      puts "3. Delete saved game"
      puts "4. Quit"
      print "Enter selection (1-4): "

      case gets.chomp
      when "1" then play
      when "2" then load_game
      when "3" then delete_save
      when "4" then puts "Thanks for playing." ; exit
      else puts "Invalid input, try again."
      end
    end
  end

  def play
    puts "Enter \"save\" at any time to save game."

    turn while true
  end
end
