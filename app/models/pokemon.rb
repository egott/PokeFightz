class Pokemon < ApplicationRecord
  validates_presence_of :name
  has_many :poke_types
  has_many :types, :through => :poke_types
  has_many :pokemon_games
  has_many :games, :through => :pokemon_games
end
