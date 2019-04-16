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

def new_human_player #création de l'HumanPlayer (interaction avec l'utilisateur)
  puts "What's your name ?"
  print ">"
  @name = gets.chomp
  human_player = HumanPlayer.new(@name)
  puts "\n\n"

  #pour que le joueur humain puisse être utiliser ensuite
  return human_player
end


def ennemies
  ennemies = []
  ennemies << player1 = Player.new("Gus")
  ennemies << player2 = Player.new("Xi-xi")
  
  #Pour afficher que les noms des deux ennemies. et pas leur ID de Player.new.
  ennemies_name = ennemies.map { |ennemie| ennemie.name  } 
  puts "Tu vas affronter #{ennemies_name.join(" et ")} !"

  #pour que le tableau puisse être utiliser par la suite.
  return ennemies
end


def fight
  
  while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  	puts "------------------------------------------"
  	puts "Voici ton état :"
  	human_player.show_state

  	puts "Quelle action veux-tu effectuer ? \n\n a - chercher une meilleure arme \n s - chercher de quoi te soigner \n\n attaquer un adversaire : \n 0 - #{player1.name} qui a #{player1.show_state} points de vie. \n 1 - #{player2.name} qui a #{player2.show_state} points de vie."
  	print ">"
  	gets 
  end


def end_of_game
  
  puts "\n The game is over.."

  if human_player.life_points > 0
  	puts "Bravo ! You smashed the other dumbass. You made them your bitches "
  else 
  	puts "Bouuuuuuuh You suck balls and got fucked by those basic bitches !"
  end
end

human_player = new_human_player
ennemies
binding.pry