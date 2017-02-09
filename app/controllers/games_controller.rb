class GamesController < ApplicationController

  def index
    @pokemons = Pokemon.all
    @game = Game.create!(user_id: "#{current_user.id}", name: 'best game ever')
    @pokemon_game = PokemonGame.new
  end

  def new
  end

  def create
  end

  private


end
