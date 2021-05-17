class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :simple_review
      t.integer :healthy_review
      t.integer :tasty_review
      t.string :comments
      t.integer :recipe_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
