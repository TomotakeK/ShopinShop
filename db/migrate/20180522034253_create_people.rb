class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :item_type
      t.string :shop_type
      t.string :shop_size
      t.string :address
      t.string :listing_title
      t.text :listing_content
      t.string :price_type
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
