require 'rails_helper'

RSpec.describe 'Applications Show Page' do
  describe 'As a visitor' do
    it 'shows the name, address, description, links of all pets and approval status' do

      jeremiah = UserApplication.create!(name: 'Jeremiah',
                                         address: '1234 Main St',
                                         city: 'Denver',
                                         state: 'CO',
                                         zip_code: 80234,
                                         description: 'I like turtles.',
                                         status: 'Accepted')
      visit "/applications/#{jeremiah.id}"

      expect(page).to have_content(jeremiah.name)
      expect(page).to have_content(jeremiah.address)
      expect(page).to have_content(jeremiah.city)
      expect(page).to have_content(jeremiah.state)
      expect(page).to have_content(jeremiah.zip_code)
      expect(page).to have_content(jeremiah.description)
      expect(page).to have_content(jeremiah.status)
    end
  end
end
