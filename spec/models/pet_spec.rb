require 'rails_helper'

describe Pet, type: :model do
  before :each do
    @shelter = create(:shelter)
    @pet = create(:pet, shelter: @shelter)
  end
  describe 'relationships' do
    it { should belong_to :shelter }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :sex}
    it {should validate_numericality_of(:approximate_age).is_greater_than_or_equal_to(0)}

    it 'is created as adoptable by default' do
      expect(@pet.adoptable).to eq(true)
    end

    it 'can be created as not adoptable' do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(adoptable: false, name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      expect(pet.adoptable).to eq(false)
    end

    it 'can be male or female' do
      expect(@pet.sex).to include('male' || 'female')
    end
  end
end
