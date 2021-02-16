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
