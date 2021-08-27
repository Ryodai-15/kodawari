class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.text :kodawari

      t.timestamps
    end
  end
end
