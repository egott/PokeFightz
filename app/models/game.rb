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

  def half_damage_to
  end

  def no_damage_to
  end

  def double_damage_to
  end

  def calculate_damage_to
  end

  def calculate_damage_from
  end

  def winner
  end


end
