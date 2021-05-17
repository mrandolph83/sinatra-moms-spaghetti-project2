class RemoveRecipeColumns < ActiveRecord::Migration[5.2]
    def change
      remove_column :recipes, :source
      remove_column :recipes, :simple_review
      remove_column :recipes, :healthy_review
      remove_column :recipes, :tasty_review
  end
end
