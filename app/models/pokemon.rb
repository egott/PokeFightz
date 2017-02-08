class Pokemon < ApplicationRecord
  validates_presence_of :name
  has_many :types
  has_and_belongs_to_many :assemblies
end
