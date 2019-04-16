

class Player

  attr_accessor :name, :life_points
  
  def initialize(name)
  	@name = name
  	@life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} point de vie !!"
  end

  def get_damage(damage)
  	@life_points = @life_points - damage #calcul le nombre de vies qui restent au joueur quand attaqué.
  	#puts "#{@name} a perdu #{damage} points de vie et il lui en reste #{@life_points} !!" 

  	if @life_points <= 0 #vérifie si le joueur est mort ou pas.
  		puts "#{@name} a été tué..."
  	end
  end

  def attack(player)
    puts "#{@name} attaque #{player.name}"
    damage = compute_damage #permet de récupérer la valeur determinée au hasard par compute_damage
    puts "#{@name} inflige #{damage} points de dommage à #{player.name} !!"

    player.get_damage(damage) #appelle la methode precedente pour calculer les points qui restent
  end

  def compute_damage
    return rand(1..6) #détermine un nombre de points perdu au hasard
  end



end


class HumanPlayer < Player
  
  attr_accessor :weapon_level

  def initialize(name)
  	super(name) # il faut le mettre avant sinon, HumanPlayer aura 10 points de vie au lieu de 100

    @life_points = 100
  	@weapon_level = 1
  end

  def show_state #ajout du niveau de l'arme
    puts "#{@name} a #{@life_points} point de vie et une arme de niveau #{@weapon_level}!!"
  end

  def compute_damage # il faut multiplier le dommage causé avec le niveau de l'arme
    rand(1..6) * @weapon_level
  end

  



end

