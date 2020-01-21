# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pokemon_tcg_sdk'
require 'pry'
#cards = Pokemon::Card.all

#create hash with key pairs

cards.map do |pokemon|
    pokemon.name
    pokemon.image_url
    pokemon.hp
    pokemon.national_pokedex_number
    pokemon.rarity
    pokemon.evolves_from
end
