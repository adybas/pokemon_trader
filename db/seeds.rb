# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pokemon_tcg_sdk'
require 'pry'
Card.destroy_all

cards = Pokemon::Card.all

cards.delete_if do |pokemon|
    pokemon.national_pokedex_number == nil
end
#binding.pry

cards.each do |pokemon|
    name = pokemon.name
    image = pokemon.image_url
    hp = pokemon.hp
    national_pokedex_number = pokemon.national_pokedex_number
    rarity = pokemon.rarity
    evolves_from = pokemon.evolves_from
    Card.create(name: name, image_url: image, hp: hp, national_pokedex_number: national_pokedex_number, rarity: rarity, evolves_from: evolves_from)
end

