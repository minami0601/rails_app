class CreatePostItems < ActiveRecord::Migration[6.0]
  def change
    create_table :post_items do |t|
      t.text "text"
      t.string "img"
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
