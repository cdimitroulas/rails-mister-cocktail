class AddReferenceToCocktails < ActiveRecord::Migration[5.0]
  def change
    add_reference :cocktails, :user
  end
end
