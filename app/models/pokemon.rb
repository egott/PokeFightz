class Pokemon < ApplicationRecord
  belongs_to :game
  has_many :pokemontypes
  validates_presence_of :name, :skill
end
