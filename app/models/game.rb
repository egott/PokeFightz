class Game < ApplicationRecord
  has_many :pokemons
  belongs_to :user
  validates :name, presence: true
end
