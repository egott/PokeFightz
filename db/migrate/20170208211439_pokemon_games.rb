class PokemonGames < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_games do |t|
      t.belongs_to :game, index: true
      t.belongs_to :pokemon, index: true

      t.timestamps
    end
  end
end
