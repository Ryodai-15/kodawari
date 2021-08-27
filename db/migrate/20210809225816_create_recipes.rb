class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :member_id
      t.integer :product_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.text :kodawari

      t.timestamps
    end
  end
end
