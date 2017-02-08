class RemoveSkillFromPokemons < ActiveRecord::Migration[5.0]
  def change
    remove_column :pokemons, :skill
  end
end
