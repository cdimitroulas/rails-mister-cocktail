require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail_ingredients_data = JSON.parse(open(url).read)

cocktail_ingredients_data["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
