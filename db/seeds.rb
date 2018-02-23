# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)n

arr=["Ruby","Ruby On Rails","Linux","Deployment","Documentation","APIs","HR policy","Vacancies","Movies"]

arr.each do |el|
	Category.where(name: el).first_or_create
end
