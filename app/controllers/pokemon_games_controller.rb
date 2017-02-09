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

    #add done button so when all 5 are clicked and when done reroute to game
    #when its clicked make button dissapear 
  end

  private
    def pokemon_params
      params.require(:pokemon_game).permit(:pokemon)
    end

end
