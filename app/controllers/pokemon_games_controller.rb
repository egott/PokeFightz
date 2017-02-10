class PokemonGamesController < ApplicationController
  def new
  end

  def create
      pokemon_params[:pokemon].split(', ').each do |pokemon|
        add_pokemon = PokemonGame.new
        add_pokemon.game_id = current_user.games.last.id
        add_pokemon.pokemon_id = Pokemon.find_by(name: pokemon).id
        add_pokemon.save
      end
      redirect_to "/games/#{current_user.games.last.id}"
  end

  private
    def pokemon_params
      params.require(:pokemon_game).permit(:pokemon)
    end

end
