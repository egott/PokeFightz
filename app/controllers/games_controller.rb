class GamesController < ApplicationController

  def index
    @pokemons = Pokemon.all
    @game = Game.create!(user_id: "#{current_user.id}", name: 'game')
    @pokemon_game = PokemonGame.new
  end

  def new
  end

  def create
  end

  def show
    @game = Game.find_by(id: params[:id])
  end


end
