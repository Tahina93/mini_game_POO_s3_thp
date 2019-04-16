require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/game'

puts " =========================================="
puts "| Are you affrayed of Death ??             |"
puts "| Welcome to the deadliest game !!         |"
puts "| The goal is simply to STAY ALIVE ...     |"
puts " =========================================="
puts "\n "

  def start
   #création de l'HumanPlayer (interaction avec l'utilisateur)
   puts "What's your name ?"
   print ">"
   @name = gets.chomp
   @new_game = Game.new(@name)
   puts "\n"
   #Pour afficher que les noms des deux ennemies. et pas leur ID de Player.new.
   ennemies_name = @new_game.ennemies.map { |ennemie| ennemie.name  } 
   puts "Tu vas affronter #{ennemies_name.join(" et ")} !"

   print "\n Tap ENTER to continue\n"
   gets 
  end

  def fight
    while @new_game.is_still_ongoing?
      puts "------------------------------------------"
  	  puts "Voici ton état : \n"
  	  @new_game.show_player
  	  @new_game.menu
  	  @new_game.menu_choice
  	  puts "\n Tap ENTER to continue"
  	  gets
  	  @new_game.ennemies_attack
  	  
  	end
  	
  	@new_game.end
  end





start
fight
#binding.pry