class PokemonGame < ApplicationRecord
    belongs_to :game
    belongs_to :pokemon
end
