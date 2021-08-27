class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :member_id
      t.integer :recipe_id
      t.text :comment
      t.integer :score

      t.timestamps
    end
  end
end
