# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 20.times do
   Task.create(name: Faker::Hacker.adjective , completed: false)
 end

  Task.create(name: Faker::Hacker.adjective , completed: true)