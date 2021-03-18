# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

NUM_USER = 6
PASSWORD ='secretone'

super_user= User.create(
    first_name: 'Shara',  
    last_name: 'Nixon',
    email: 'shara@venue.com',
    password: PASSWORD,
    is_admin: true
)

super_user= User.create(
    first_name: 'Aaron',  
    last_name: 'siebenga',
    email: 'aaron@venue.com',
    password: PASSWORD,
    is_admin: true
)

NUM_USER.times do
    first_name= Faker::Name.first_name 
    last_name= Faker::Name.last_name 
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}@example.com",
        password: PASSWORD
    )
    end
    users=User.all

    puts Cowsay.say("Generated #{users.count} users.",:frogs)