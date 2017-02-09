class PokemonGamesController < ApplicationController
  def new
    @pokemon_game = PokemonGame.new
  end

  def create
    add_pokemon = PokemonGame.new
    add_pokemon.game_id = current_user.games.last.id
    name = pokemon_params

    add_pokemon.pokemon_id = Pokemon.find_by(name: pokemon_params[:pokemon]).id

    add_pokemon.save

  end

  private
    def pokemon_params
      params.require(:pokemon_game).permit(:pokemon)
    end

end
