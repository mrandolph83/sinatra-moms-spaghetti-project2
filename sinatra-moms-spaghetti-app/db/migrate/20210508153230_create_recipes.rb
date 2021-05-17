class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :content
      t.string :category
      t.string :source
      t.integer :user_id
      t.integer :simple_review
      t.integer :healthy_review
      t.integer :tasty_review

      t.timestamps null: false
    end
  end
end
