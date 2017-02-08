class Pokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :skill, null: false
      t.references :game

      t.timestamps
    end
  end
end
