require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit an applications show page' do

  it 'I can approve a pet on an application'  do
    jeremiah = UserApplication.create!(name: 'Jeremiah', address: "123 Main St", city: "Denver", state: "CO", zip: 80234)
    shelter = create(:shelter)
    puppy = create(:pet, shelter: shelter)
    pet_app = PetApplication.create!(user_application: jeremiah, pet: puppy, approved: nil)

    visit "/admin/user_applications/#{jeremiah.id}"

    expect(current_path).to eq "/admin/user_applications/#{jeremiah.id}"
    click_button "Approve Adoption"
    pet_app.reload

    expect(current_path).to eq "/admin/user_applications/#{jeremiah.id}"
    expect(page).to have_no_button("Approve Adoption")
    expect(page).to have_content("Approved!")
  end

  it 'I can reject a pet on an application'  do
    jeremiah = UserApplication.create!(name: 'Jeremiah', address: "123 Main St", city: "Denver", state: "CO", zip: 80234)
    shelter = create(:shelter)
    puppy = create(:pet, shelter: shelter)
    pet_app = PetApplication.create!(user_application: jeremiah, pet: puppy, approved: nil)

    visit "/admin/user_applications/#{jeremiah.id}"

    expect(current_path).to eq "/admin/user_applications/#{jeremiah.id}"
    click_button "Reject Adoption"
    pet_app.reload

    expect(current_path).to eq "/admin/user_applications/#{jeremiah.id}"
    expect(page).to have_no_button("Approve Adoption")
    expect(page).to have_no_button("Reject Adoption")
    expect(page).to have_content("We are sorry to inform you your adoption has been rejected.")
  end

  it 'Approve/Reject on one application doesnt affect other applications' do
    jeremiah = UserApplication.create!(name: 'Jeremiah', address: "123 Main St", city: "Denver", state: "CO", zip: 80234)
    dave = UserApplication.create!(name: 'dave', address: "123 Main St", city: "Denver", state: "CO", zip: 80234)

    shelter = create(:shelter)
    puppy = create(:pet, shelter: shelter)
    pet_app = PetApplication.create!(user_application: jeremiah, pet: puppy, approved: nil)
    pet_app2 = PetApplication.create!(user_application: dave, pet: puppy, approved: nil)

    visit "/admin/user_applications/#{jeremiah.id}"

    expect(current_path).to eq "/admin/user_applications/#{jeremiah.id}"
    click_button "Reject Adoption"
    pet_app.reload

    visit "/admin/user_applications/#{dave.id}"

    expect(page).to have_button("Approve Adoption")
    expect(page).to have_button("Reject Adoption")
  end
end
end
