class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :address
      t.string :img
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
