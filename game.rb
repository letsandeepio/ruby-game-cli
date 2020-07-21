# frozen_string_literal: true

# game class to handle game logic
class Game
  attr_accessor :player1, :player2, :chances, :current_player
  def initialize
    @player1 = ''
    @player2 = ''
    @chances = 3
    @current_player = ''
  end

  def endgame?
    !(player1.lost? || player2.lost?)
  end

  def start
    set_player_names
    @current_player = player1
    ask_questions while endgame?
    puts "#{current_player.name} wins with score #{current_player.chances}/#{chances}"
  end

  def ask_questions
    puts "\n=========== new turn ========\n"
    puts "#{current_player.name} get ready. Its your turn.\n"
    ask_question
    print_score
    toggle_players
  end

  def set_player_names
    puts 'Welcome to the MatheMagic Trivia 2.0'
    puts 'This is a two player game.'
    puts "\nPlease enter player one name:"
    player_1_name = gets.chomp
    puts "\nPlease enter player two name:"
    player_2_name = gets.chomp
    puts "#{player_1_name} and #{player_2_name}, get ready for showdown."
    puts "Each of you will have #{@chances} chances."
    @player1 = Player.new(player_1_name, @chances)
    @player2 = Player.new(player_2_name, @chances)
  end

  def print_score
    puts "\nChances Remaining: \n#{player1.name} #{player1.chances}/#{@chances}"
    puts "Vs.\n#{player2.name} #{player2.chances}/#{@chances}\n"
  end

  def toggle_players
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

  def confirm_answer
    question = Question.new
    p question.ask
    print '>'
    answer = gets.chomp
    if question.check_answer?(answer)
      puts "Yes #{current_player.name}, you are absolutely correct.\n"
    else
      puts "Seriously #{current_player.name}? It's Wrong."
      current_player.lose_chance
    end
  end
end
