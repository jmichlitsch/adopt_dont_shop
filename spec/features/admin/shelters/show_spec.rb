require 'rails_helper'

RSpec.describe 'Admin Shelter Show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @application1 = create(:user_application)
    @application2 = create(:user_application)
    @application3 = create(:user_application)
    @application4 = create(:user_application)

    PetApplication.create(pet: @pet1, user_application: @application1 )
    PetApplication.create(pet: @pet2, user_application: @application2)
    PetApplication.create(pet: @pet3, user_application: @application3)
    PetApplication.create(pet: @pet1, user_application: @application4)
    @application1.update(status: "Pending")
    @application2.update(status: "Pending")

    visit "/admin/shelters/#{@shelter1.id}"
  end
  describe 'Shelter Attributes' do
    it 'can display dynamic attributes based on shelter visited' do
      expect(page).to have_content(@shelter1.address)
      expect(page).to have_content(@shelter1.name)
    end
  end
end
