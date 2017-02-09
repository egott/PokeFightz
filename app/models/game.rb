class Game < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :pokemon_games
  has_many :pokemons, :through => :pokemon_games

  def half_damage_from
    half_from_types = []
    self.pokemons.each do |pokemon|
      pokemon.types.each do |type|
        half_from_types.concat(type.half_damage_from)
      end
    end
    half_from_types.uniq
  end


  def winner
  end


end
