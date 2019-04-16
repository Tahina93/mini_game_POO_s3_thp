class Game

attr_accessor :human_player :ennemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @ennemies = []
    ["Machin", "Truc", "Bidule", "Muche"]each { |ennemy| @ennemies << Player.new(ennemy)  }
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
    puts "\n\n attaquer un adversaire : \n"
    puts " 0 - #{player1.show_state}  \n 1 - #{player2.show_state} "

  end