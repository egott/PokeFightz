class Pokemon < ApplicationRecord
  validates_presence_of :name
  has_many :types
end
