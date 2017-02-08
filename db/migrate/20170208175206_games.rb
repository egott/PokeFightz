class Games < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.boolean :winner, default: false
      t.references :user

      t.timestamps
    end
  end
end
