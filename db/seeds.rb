# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
Category.create(category_name: 'Tools')
Category.create(category_name: 'Toys')
Category.create(category_name: 'Gardening Items')
Category.create(category_name: 'Others')