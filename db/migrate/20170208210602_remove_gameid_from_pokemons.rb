class RemoveGameidFromPokemons < ActiveRecord::Migration[5.0]
  def change
    remove_column :pokemons, :game_id
  end
end
