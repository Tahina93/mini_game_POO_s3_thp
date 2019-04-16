

class Player

  attr_accessor :name, :life_points
  
  def initialize(name)
  	@name = name
  	@life_points = 10
  end

  def show_state
    "#{@name} a #{@life_points} point de vie !!"
  end

  def get_damage(damage)
  	@life_points = @life_points - damage #calcul le nombre de vies qui restent au joueur quand attaqué.
  	puts "#{@name} a perdu #{damage} points de vie et il lui en reste #{@life_points} !!" 

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


  def search_weapon
    @new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{@new_weapon}.."
    puts " "
    if @new_weapon > @weapon_level
    	@weapon_level = @new_weapon
    	puts "Youpi ! Elle est meilleure que ton arme actuelle, tu la prends pour niquer des mères!!"
    else 
    	puts "Saperlipopette !! Elle n'est pas mieux que ton arme actuelle.. "
    end

  end


  def search_health_pack
    @new_life = rand(1..6)
    if @new_life == 1
      puts "Tu n'as rien trouvé .."
    elsif @new_life == 6
      @life_points = @life_points + 80

      #Pour pas que le nombre de vies ne dépasse 100
      if @life_points > 100
      	@life_points = 100
      end

      puts "Bravo ! Tu as trouvé un pack de + 80 points de vie !!"
    else
      @life_points = @life_points + 50

      #Pour pas que le nombre de vies ne dépasse 100
      if @life_points > 100
      	@life_points = 100
      end

      puts "Bravo ! tu as trouvé un pack de + 50 points de vie !!"
    end
    	
  end



end

