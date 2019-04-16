class Game

attr_accessor :human_player, :ennemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @ennemies = []
    ["Machin", "Truc", "Bidule", "Muche"].each { |ennemy| @ennemies << Player.new(ennemy)  }
  end


  def kill_player(ennemy)
    @ennemies.delete(ennemy) if ennemy.life_points <= 0
  end


  def is_still_ongoing?
    !@ennemies.empty? && human_player.life_points > 0
  end


  def show_player
    puts @human_player.show_state
    puts "Il reste #{@ennemies.length} ennemi(s) à combattre" 
  end


  def menu
    puts "\n Quelle action veux-tu effectuer ?"
    puts "\n\n a - chercher une meilleure arme "
    puts "\n s - chercher de quoi te soigner "
    puts "\n\n attaquer un adversaire :"
    @ennemies.length.times do |index|
      puts "#{index} - #{ennemies[index].show_state}"
    end



  end

  def menu_choice

  	print ">"
    choice = gets.chomp 
    #appelle la methode pour recupérer des armes
  	if choice == "a"
  	  human_player.search_weapon 	
  	#appelle la methode pour récupérer des vies
  	elsif choice == "s"
  	  human_player.search_health_pack

  	elsif choice.to_i
  	  human_player.attack(@ennemies[choice.to_i])
  	    if @ennemies[choice.to_i].life_points <= 0
  	      kill_player(@ennemies[choice.to_i])
  	    end 
    end
  end



  def ennemies_attack
    @ennemies.each do |player|
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


  def end
    puts "\n The game is over.."

    if human_player.life_points > 0
  	  puts "Bravo ! You smashed the other dumbass. You made them your bitches "
    else 
  	  puts "Bouuuuuuuh You suck balls and got fucked by those basic bitches !"
    end
  end

end





