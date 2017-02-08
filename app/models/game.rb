class Game < ApplicationRecord
  # has_and_belongs_to_many :pokemons
  belongs_to :user
  validates :name, presence: true
  has_many :pokemon_games
  has_many :pokemons, :through => :pokemon_games
end
