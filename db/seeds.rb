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

DOSES = %w[pinches dashes shots mL fingers]
DOSES_SNGL = %w[pinch dash shot mL finger]
#browser = Watir::Browser.new


urls = ["https://images.unsplash.com/photo-1542518392-13317b1ee2a2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1557163639-573a6b64a424?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1530991808291-7e157454758c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1563223771-4de049c29950?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1527661591475-527312dd65f5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1555901113-a5a735a05ef4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1542849187-5ec6ea5e6a27?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1560351520-48e05f3d7d16?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1561577975-88bbd24e0ad7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1514361892635-6b07e31e75f9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1512103865222-dcf9531c9961?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1521142777091-63e1891f46d3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1560179304-6fc1d8749b23?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1514362113780-401cb55de760?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1561019150-e713f284a01e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1545587128-de0535fab179?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1536034274201-a4b2578449f5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1536599424071-0b215a388ba7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9", "https://images.unsplash.com/photo-1561019150-e713f284a01e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9"]

# seed cocktails
rand_numbers = (1..1000).to_a
20.times do |i|
  # create cocktail with random name/pic
  # get random picture from unsplace and headless browser
  #i = rand_numbers.sample
  #browser.goto("https://source.unsplash.com/collection/962396/#{i}")
  #rand_numbers.delete(i)
  #rand_pic = browser.url
  rand_pic = urls[i]
  rand_name = "#{Faker::Movies::HarryPotter.spell} #{Faker::Hipster.word}"
  this_cocktail = Cocktail.new(name: rand_name, pic_url: rand_pic)

  # add 1-10 random ingredients to this cocktail (non repeating)
  avail_ingredient_ids = Ingredient.ids
  rand(1..10).times do
    # first pick the ingredient (then remove it from available ingredient array)
    ingredient_id = avail_ingredient_ids.sample
    rand_ingredient = Ingredient.find(ingredient_id)
    avail_ingredient_ids.delete(ingredient_id)
    # add 1-50 somethings of this ingredient
    count = rand(1..10)
    rand_ammount = "#{count} #{count == 1 ? DOSES_SNGL.sample : DOSES.sample}"
    rand_dose = Dose.new(description: rand_ammount,
                         ingredient: rand_ingredient,
                         cocktail: this_cocktail)
    rand_dose.save!
  end
end

browser.quit
