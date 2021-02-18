require 'factory_bot'
require 'spec/facorties/pet'
require 'spec/facorties/shelter'
require 'spec/facorties/pet'
require 'faker'
UserApplication.destroy_all
Pet.destroy_all
Shelter.destroy_all
jeremiah = UserApplication.create!(name: 'Jeremiah',
                                     address: '123 Main St',
                                     city: 'Denver',
                                     state: 'CO',
                                     zip: '80234',
                                     description: 'I like turtles.',
                                     status: 'Accepted')
  FactoryBot.create_list(:shelter, rand(2..5))
  Shelter.all.each do |shelter|
   rand(2..5).times do
   FactoryBot.create(:pet, shelter: shelter)
   end
 end
# @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
# @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
# @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
# @shelter1.pets.create!(image:"puppies.jpeg", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
# @shelter2.pets.create!(image:"puppies.jpeg", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
# @shelter1.pets.create!(image:"puppies.jpeg", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
# @shelter1.pets.create!(image:"puppies.jpeg", name: "pepper", description: "dog", approximate_age: 6, sex: "male")
# @shelter1.pets.create!(image:"puppies.jpeg", name: "tucker", description: "dog", approximate_age: 3, sex: "male")
# @shelter1.pets.create!(image:"puppies.jpeg", name: "Babe", description: "dog", approximate_age: 9, sex: "male")
# @shelter1.pets.create!(image:"puppies.jpeg", name: "Luna", description: "dog", approximate_age: 2, sex: "male")
# @shelter1.pets.create!(image:"puppies.jpeg", name: "Rex", description: "dog", approximate_age: 4, sex: "male")
# @shelter2.pets.create!(image:"puppies.jpeg", name: "Party", description: "cat", approximate_age: 5, sex: "female")
# @shelter2.pets.create!(image:"puppies.jpeg", name: "Chip", description: "cat", approximate_age: 1, sex: "female")
# @shelter2.pets.create!(image:"puppies.jpeg", name: "Asshole", description: "cat", approximate_age: 8, sex: "female")
# @shelter2.pets.create!(image:"puppies.jpeg", name: "Deus", description: "cat", approximate_age: 3, sex: "female")
