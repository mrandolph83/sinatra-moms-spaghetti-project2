class AddPicUrlColumnToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :pic_url, :string
  end
end