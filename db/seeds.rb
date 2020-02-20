# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed ingredients list (100 to choose from)
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data = JSON.parse(open(url).read)
list = data["drinks"]
list.each { |entry| Ingredient.create(name: entry["strIngredient1"]) }

DOSES = %w[pinches dashes shots mL]

# seed cocktails
20.times do
  # create cocktail with random name
  rand_name = "#{Faker::FunnyName.name.downcase} #{Faker::Hipster.word}"
  this_cocktail = Cocktail.new(name: rand_name)

  # add 1-10 random ingredients to this cocktail (non repeating)
  avail_ingredient_ids = Ingredient.ids
  rand(1..10).times do
    # first pick the ingredient (then remove it from available ingredient array)
    ingredient_id = avail_ingredient_ids.sample
    rand_ingredient = Ingredient.find(ingredient_id)
    avail_ingredient_ids.delete(ingredient_id)
    # add 1-50 somethings of this ingredient
    rand_ammount = "#{rand(1..50)} #{DOSES.sample}"
    rand_dose = Dose.new(description: rand_ammount,
                         ingredient: rand_ingredient,
                         cocktail: this_cocktail)
    rand_dose.save!
  end
end
