require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Gus")
player2 = Player.new("Xi-xi")

puts "#{player1.name} et #{player2.name} vont s'affronter sans pitié !!!"

while player1.life_points > 0 && player2.life_points >0 
  puts "-----------------------------------"
  puts "Voici l'état de nos joueurs :"
  puts player1.show_state
  puts player2.show_state
  puts " "

  puts "Place à l'attaque !!!!!"
  player1.attack(player2)
    if player2.life_points <= 0
    	break
    end
  puts " "
  player2.attack(player1)  
 
end

#juste pour pimper un peu mon jeu et annoncer le vainqueur <3
winner = player1.life_points > player2.life_points ? player1 : player2

puts " "
puts "**********************************************"
puts "And the winner is : #{winner.name}"
puts "**********************************************"

#binding.pry