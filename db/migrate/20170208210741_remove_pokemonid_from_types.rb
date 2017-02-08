class RemovePokemonidFromTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :types, :pokemon_id
  end
end
