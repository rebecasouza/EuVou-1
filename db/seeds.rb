# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adding default categories
categories = [
	"Negócios",
	"Esportes",
	"Saúde",
	"Fitness",
	"Festa",
	"Educação",
	"Hobbies",
	"Artes",
	"Música",
	"Shows",
	"Festival",
	"Caridade",
	"Gastronomia",
	"Bebidas",
	"Ciência e Tecnologia",
	"Cinema",
	"Espiritualidade",
	"Moda",
	"Viagem",
	"Exposição"
]

categories.each do |category|
	Category.create!(name: category)
end