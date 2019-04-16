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
  puts "\n"




  #création des player automatiques et mise de leur info dans un array
  ennemies = []
  player1 = Player.new("Gus")
  player2 = Player.new("Xi-xi")
  ennemies << player1
  ennemies << player2
  
  #Pour afficher que les noms des deux ennemies. et pas leur ID de Player.new.
  ennemies_name = ennemies.map { |ennemie| ennemie.name  } 
  puts "Tu vas affronter #{ennemies_name.join(" et ")} !"
  
  #pour faire des pauses dans le jeu et le rendre plus clair
  print "\n Tap ENTER to continue\n"
  gets 

  #Début du jeu interactif 
  while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  	puts "------------------------------------------"
  	puts "Voici ton état : \n"
  	human_player.show_state


  	#menu d'action que l'human player peut effectuer
  	puts "\n Quelle action veux-tu effectuer ? \n\n a - chercher une meilleure arme \n s - chercher de quoi te soigner \n\n attaquer un adversaire : \n 0 - #{player1.show_state}  \n 1 - #{player2.show_state} "
  	print ">"
  	choice = gets.chomp 

  	#appelle la methode pour recupérer des armes
  	if choice == "a"
  	  human_player.search_weapon
  	end

  	#appelle la methode pour récupérer des vies
  	if choice == "s"
  	  human_player.search_health_pack
  	end

  	#permet d'attaquer le joueur 1
  	if choice == "0"
  	  human_player.attack(player1)
  	end

  	#permet d'attaquer le joueur 2
  	if choice == "1"
  	  human_player.attack(player2)
  	end
    
    #Pour avoir plus de visibilité dans le jeu
    print "\n Tap ENTER to continue\n"
    gets 

  	#Partie ou les joueurs automatiques attaquent
  	puts "\n ------------------------------------------\n C'est maintenant aux autres joueurs d'attaquer : \n\n"
  	#boucle pour que chacun des ennemies attaquent le joueur humain.
  	ennemies.each do |player|
      #Si jamais un des joueur meurt, qu'il ne puisse plus attaquer
      if player.life_points <= 0 
      	puts "#{player.name} est mort il ne peux plus t'attaquer \n \n"
    	next #-----> si un seul joueu est mort, l'autre attaque toujours (different de "break" qui sort carrement de la boucle et ça foire si l'un des joueur n'est pas mort)
      #si pas mort, il(s) attaquent
      else 
        player.attack(human_player)
        puts "\n"
        print "\n Tap ENTER to continue \n"
        gets
      end
       
    end
  end






  #FIN DU JEU
  puts "\n The game is over.."

  if human_player.life_points > 0
  	puts "Bravo ! You smashed the other dumbass. You made them your bitches "
  else 
  	puts "Bouuuuuuuh You suck balls and got fucked by those basic bitches !"
  end


#binding.pry
