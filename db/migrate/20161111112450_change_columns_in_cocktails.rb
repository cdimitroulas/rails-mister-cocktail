class ChangeColumnsInCocktails < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktails, :photo, :string
    remove_column :cocktails, :url
  end
end
