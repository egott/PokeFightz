# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
Game.create(name: "game1", user_id: 1)

(1..18).each do |n|
  response = Unirest.get("http://pokeapi.co/api/v2/type/#{n}").raw_body
  name = JSON.parse(response)["name"]

  half_damage_from = []
  JSON.parse(response)["damage_relations"]["half_damage_from"].each do |relation|
    half_damage_from << relation["name"]
  end

  no_damage_from = []
  JSON.parse(response)["damage_relations"]["no_damage_from"].each do |relation|
     no_damage_from << relation["name"]
  end

  half_damage_to = []
  JSON.parse(response)["damage_relations"]["half_damage_to"].each do |relation|
     half_damage_to << relation["name"]
  end

  double_damage_from = []
  JSON.parse(response)["damage_relations"]["double_damage_from"].each do |relation|
     double_damage_from << relation["name"]
  end

  no_damage_to = []
  JSON.parse(response)["damage_relations"]["no_damage_to"].each do |relation|
     no_damage_to << relation["name"]
  end

  double_damage_to = []

  JSON.parse(response)["damage_relations"]["double_damage_to"].each do |relation|
     double_damage_to << relation["name"]
  end
  type = Type.create!(name: name, half_damage_from: half_damage_from, no_damage_from: no_damage_from, half_damage_to: half_damage_to, double_damage_from: double_damage_from, no_damage_to: no_damage_to, double_damage_to: double_damage_to)

end

csv_pokedex = File.read(Rails.root.join('lib', 'seeds', 'list_pokedex.csv'))
@csv = CSV.parse(csv_pokedex, headers: true)
(1..50).each do |n|
  response = Unirest.get("http://pokeapi.co/api/v2/pokemon/#{n}").raw_body
  pokemon = Pokemon.create!(name: JSON.parse(response)["name"], url: @csv[n]['image_url'])
  #pokemontypes = Pokemon.create!(name:JSON.parse(response)["types"])
  JSON.parse(response)["types"].each do |x|
    id = Type.find_by(name: x["type"]["name"]).id
    PokeType.create!(pokemon_id: n, type_id: id)
  end
end
