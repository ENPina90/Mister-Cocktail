# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
file = URI.open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
json = JSON.parse(file)
ingredients = json['drinks']

ingredients.each do |ingredient|
  new_ingredient = ingredient['strIngredient1']
  new_saved = Ingredient.create!(name: new_ingredient)
  puts "Created #{new_saved.name}"
end
puts 'Finished!'
