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

10.times do
  photo = Faker::LoremFlickr.image(search_terms: ['cocktail'])
  file = URI.open(photo)
  drink = Faker::Hipster.words
  cocktail = Cocktail.new(name: drink[1])
  cocktail.photo.attach(io: file, filename: "#{drink}.png", content_type: 'image/png')
  new_saved = cocktail.save!
  # puts "Created #{new_saved}"
end
puts 'Finished!'

Cocktail.all.each do |cocktail|
  ingredients = Ingredient.all
  dose_one = Dose.new(description: "#{rand(10)} oz")
  dose_one.cocktail_id = cocktail.id
  dose_one.ingredient_id = ingredients.sample.id
  dose_one.save!
  dose_two = Dose.new(description: "#{rand(10)} oz")
  dose_two.cocktail_id = cocktail.id
  dose_two.ingredient_id = ingredients.sample.id
  dose_two.save!
end
puts 'Finished!'
