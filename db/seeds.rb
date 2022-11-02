puts "Creating Users"
# User.create!(
#     username: "Mweneh",
#     firstname: "Mweneh",
#     lastname:"David",
#     password: "@Ongaro17$",
#     email: "dane.gorczany@green.info",
#     user_type: 1
# )
10.times do
    User.create(
        username: Faker::Name.name,
        firstname:Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 8),
        user_type: 0
    )
end
puts 'All done Sinyor!'



puts 'Now 🌱  seeding recipes...'

response = RestClient.get("https://recipes.eerieemu.com/api/recipe/?format=json")
recipes = JSON.parse(response)  

recipes = recipes["results"] 

recipes.map do |recipe|
    new_recipe = Recipe.create(
        foodname: recipe["name"],
        image: recipe["image_path"],
        description: recipe["description"], 
        ingredients: recipe["ingredients"], 
        tutorial: recipe["instructions"],
        country: Faker::Address.country,
        servings: recipe["servings"], 
        rating: recipe["rating_value"],
        user_id: User.all[rand(0...User.count)].id
    )
end
puts "✅ Done seeding!"
