class AddColumnToDoses < ActiveRecord::Migration[5.0]
  def change
    add_reference :doses, :cocktail
    add_reference :doses, :ingredient
  end
end
