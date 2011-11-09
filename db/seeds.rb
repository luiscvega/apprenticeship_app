# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
User.create(:first_name => "Miguel", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")