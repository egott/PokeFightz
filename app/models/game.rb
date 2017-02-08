class Game < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :pokemon_games
  has_many :pokemons, :through => :pokemon_games

  def winner
  end
  
end
