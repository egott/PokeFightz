class Pokemon < ApplicationRecord
  belongs_to :game
  validates_presence_of :name, :skill
end
