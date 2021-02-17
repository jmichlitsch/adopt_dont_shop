require 'rails_helper'

RSpec.describe 'Applications Show Page' do
  before :each do
    @shelter = create(:shelter)
    @pet1 = create(:pet, shelter: @shelter)
    @pet2 = create(:pet, shelter: @shelter)
    @user = create(:user_application)
    @pet_app = PetApplication.create!(user_application: @user, pet: @pet1)
  end
    describe 'As a visitor' do
      describe 'when I visit an applications show page' do
        it 'I see name of applicant, address and description' do
        visit "/user_applications/#{@user.id}"
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.address)
      expect(page).to have_content(@user.city)
      expect(page).to have_content(@user.state)
      expect(page).to have_content(@user.zip)
      expect(page).to have_content("In Progress")
      expect(page).to have_content(pet1.name)
        end
      end
      it 'I can search for a pet and add it to the page'  do
        visit "/user_applications/#{@user.id}"
     fill_in "Add a Pet to this Application", with:"#{@pet1.name}"
     click_on "Search"
     click_link "Adopt this Pet"
     expect(page).to have_content(@pet1.name)
      end

      it 'When I have a pet, I can submit my application'  do
        visit "/user_applications/#{@user.id}"
      fill_in "Add a Pet to this Application", with:"#{pet1.name}"
      click_on "Search"
      click_link "Adopt this Pet"
      expect(page).to have_button("Submit")
      expect(page).to have_content("In Progress")
      end
    end
end
