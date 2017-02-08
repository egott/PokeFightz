class PokeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :poke_types do |t|
      t.references :pokemon
      t.references :type
    end
  end
end
