class Game < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :pokemon_games
  has_many :pokemons, :through => :pokemon_games



  def half_damage_from(i)
    half_from_types = []
    self.pokemons[i].types.each do |type|
        half_from_types.concat(type.half_damage_from)
    end
    half_from_types.uniq
  end

  def no_damage_from(i)
    no_from_types = []
    self.pokemons[i].types.each do |type|
        no_from_types.concat(type.no_damage_from)
    end
    no_from_types.uniq
  end

  def double_damage_from(i)
    double_from_types = []
    self.pokemons[i].types.each do |type|
        double_from_types.concat(type.double_damage_from)
    end
    double_from_types.uniq
  end

  def half_damage_to(i)
    half_to_types = []
    self.pokemons[i].types.each do |type|
      half_to_types.concat(type.half_damage_to)
    end
    self.computer_types(i).each do |com_type|
      if half_to_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def no_damage_to(i)
    no_to_types = []
    self.pokemons[i].types.each do |type|
      no_to_types.concat(type.no_damage_to)
    end
    self.computer_types(i).each do |com_type|
      if no_to_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def double_damage_to(i)
    double_to_types = []
    self.pokemons[i].types.each do |type|
      double_to_types.concat(type.double_damage_to)
    end
    self.computer_types(i).each do |com_type|
      if double_to_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def computer_pokemon(a,b,c,d,e)
    @computer_team = [Pokemon.all.sample,Pokemon.all.sample,Pokemon.all.sample,Pokemon.all.sample,Pokemon.all.sample]
  end
  #take in i and result of computer_pokemon
  def computer_types(i)
    @computer_team = [Pokemon.all[5],Pokemon.all[10],Pokemon.all[15],Pokemon.all[20],Pokemon.all[25]]
    enemy_types = []
    @computer_team[i].types.each do |type|
      enemy_types << type.name
    end
    enemy_types
  end

  #calculate damage
  def calculate_damage_to(i)
    damage_to = 1
    if self.no_damage_to(i) == true
      damage_to = 0
    else
      if self.half_damage_to(i) == true
        damage_to *= 0.5
      end
      if self.double_damage_to(i) == true
        damage_to *= 2
      end
    end
    damage_to
  end
  #calculate damage from
  def calculate_damage_from
  end

  def winner
  end


end
