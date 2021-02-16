require 'rails_helper'

RSpec.describe 'Applications Show Page' do
  before :each do
    @user = create(:user_application)
  end
  describe 'As a visitor' do
    it 'shows application information' do
      visit "/user_applications/#{@user.id}"

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.address)
      expect(page).to have_content(@user.city)
      expect(page).to have_content(@user.state)
      expect(page).to have_content(@user.zip)
      expect(page).to have_content(@user.description)
      expect(page).to have_content(@user.status)
      expect(page).to have_link("")
    end
  end
end
