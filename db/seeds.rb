# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
Category.create(id: '1', category_name: 'Tools')
Category.create(id: '2', category_name: 'Toys')
Category.create(id: '3', category_name: 'Gardening Items')
Category.create(id: '4', category_name: 'Others')

Item.destroy_all

Item.new(:id => '1', :name => 'Drill', :description => 'Mint condition. Like new.',
         :remote_image_url => "http://toolmonger.com/wp-content/uploads/2006/05/standarddrill.jpg",
         :price => 45.99, :keywords => 'tools, drill',
         :category_id => '1', :user_id => '1').save(:validate => false)


Item.new(:id => '2', :name => 'Another Drill', :description => 'Brand new. Still in the original box.',
         :remote_image_url => "http://cdn.dice.com/wp-content/uploads/2012/08/shutterstock_74316340.jpg",
         :price => '65', :keywords => 'tools, drill',
         :category_id => '1', :user_id => '1').save(:validate => false)


Item.new(:id => '3', :name => 'Screwdriver', :description => 'Used but in a good condition.',
         :remote_image_url => "http://www.clipartlord.com/wp-content/uploads/2013/04/screwdriver.png",
         :price => 19, :keywords => 'tools, screwdriver',
         :category_id => '1', :user_id => '1').save(:validate => false)

Item.new(:id => '4', :name => 'Toy', :description => 'Very useful if you have a child.',
         :remote_image_url => "http://www.frenchblossom.com/1314-2620-thickbox/bird-of-paradise-pull-along-toy.jpg",
         :price => 8.99, :keywords => 'toys, fun',
         :category_id => '2', :user_id => '1').save(:validate => false)

Item.new(:id => '5', :name => 'Bike', :description => 'This bike will make crazy.',
         :remote_image_url => "http://salsacycles.com/files/bikes/bikes_Mukluk2_2013_2.jpg",
         :price => 145.45, :keywords => 'bike, workout',
         :category_id => '4', :user_id => '1').save(:validate => false)


puts "Success: The data has been successfully populated."