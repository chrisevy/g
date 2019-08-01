# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


tag_array= ["#Bromance", "#PasDamalGame", "#EnMarche", "#LesPauvres", "#LesRiches", "#LesAutres", 
"#LesRoux", "#JPP", "#VDM", "#NoHomo"]
tag_array.each do |tag| 
    tags = Tag.create(title: tag)
end
10.times do 
    cities = City.create(
        city_name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
    users = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        age: rand(18..50)
        #city: cities
    )
end
20.times do
    
    gossip = Gossip.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph(sentence_count: 3),
    
    )
end
10.times do 
    gossip_all = Gossip.all#l'ensemble des Gossips
    tag_rand = Tag.all.sample#un TAG au hasard
    gossip_all.each do |gossip|#on parcours tous les gossip et on fait associer des tags
        JoinTableTagGossip.create(gossip: gossip, tag: tag_rand)
    end
end
