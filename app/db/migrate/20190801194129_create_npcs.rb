class CreateNpcs < ActiveRecord::Migration[5.2]
  def change
    create_table :npcs do |t|
      t.string :name
      t.integer :age
      t.string :favorite_drink
    end
  end
end