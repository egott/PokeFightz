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
    half_to_types.uniq
  end

  def no_damage_to(i)
    no_to_types = []
    self.pokemons[i].types.each do |type|
      no_to_types.concat(type.no_damage_to)
    end
    no_to_types.uniq
  end

  def double_damage_to(i)
    double_to_types = []
    self.pokemons[i].types.each do |type|
      double_to_types.concat(type.double_damage_to)
    end
    double_to_types.uniq
  end

  def computer_pokemon
    #create 5 pokemon
  end
  #take in i and result of computer_pokemon
  def computer_types
    enemy_types = []
    Pokemon.all.sample.types.each do |type|
      enemy_types << type.name
    end
    enemy_types
  end

  #calculate damage
  def calculate_damage_to(computer)


  end
  #calculate damage from
  def calculate_damage_from
  end

  def winner
  end


end
