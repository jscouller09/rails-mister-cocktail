class AddPicUrlToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :pic_url, :string
  end
end
