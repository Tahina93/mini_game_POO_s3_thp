require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " =========================================="
puts "| Are you affrayed of Death ??             |"
puts "| Welcome to the deadliest game !!         |"
puts "| The goal is simply to STAY ALIVE ...     |"
puts " =========================================="
puts "\n "

 #création de l'HumanPlayer (interaction avec l'utilisateur)
  puts "What's your name ?"
  print ">"
  @name = gets.chomp
  human_player = HumanPlayer.new(@name)
  puts "\n\n"




  ennemies = []
  player1 = Player.new("Gus")
  player2 = Player.new("Xi-xi")
  ennemies << player1
  ennemies << player2
  
  #Pour afficher que les noms des deux ennemies. et pas leur ID de Player.new.
  ennemies_name = ennemies.map { |ennemie| ennemie.name  } 
  puts "Tu vas affronter #{ennemies_name.join(" et ")} !"

  #pour que le tableau puisse être utiliser par la suite.




  
  while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  	puts "------------------------------------------"
  	puts "Voici ton état : \n"
  	human_player.show_state


  	puts "\n Quelle action veux-tu effectuer ? \n\n a - chercher une meilleure arme \n s - chercher de quoi te soigner \n\n attaquer un adversaire : \n 0 - #{player1.show_state}  \n 1 - #{player2.show_state} "
  	print ">"
  	choice = gets.chomp 

  	if choice == "a"
  	  human_player.search_weapon
  	end

  	if choice == "s"
  	  human_player.search_health_pack
  	end

  	if choice == "0"
  	  human_player.attack(player1)
  	end

  	if choice == "1"
  	  human_player.attack(player2)
  	end
    
    gets 

  	puts "\n ------------------------------------------\n C'est maintenant aux autres joueurs d'attaquer : \n\n"
  	ennemies.each do |player|
      if player.life_points <= 0 
      	puts "#{player.name} est mort il ne peux plus t'attaquer \n \n"
    	next
      else 
        player.attack(human_player)
        puts "\n"
        gets
      end
       
    end

    


  end






  
  puts "\n The game is over.."

  if human_player.life_points > 0
  	puts "Bravo ! You smashed the other dumbass. You made them your bitches "
  else 
  	puts "Bouuuuuuuh You suck balls and got fucked by those basic bitches !"
  end


#human_player = new_human_player
#ennemies = ennemies
#fight(human_player, ennemies)
#end_of_game
#binding.pry
