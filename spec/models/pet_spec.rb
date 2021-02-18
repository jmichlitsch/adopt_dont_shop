require 'rails_helper'

describe Pet, type: :model do
  before :each do
    @shelter = create(:shelter)
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
      @pet = create(:pet, shelter: @shelter)
      expect(@pet.adoptable).to eq(true)
    end

    it 'can be created as not adoptable' do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(adoptable: false, name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      expect(pet.adoptable).to eq(false)
    end

    it 'can be male or female' do
      @pet = create(:pet, shelter: @shelter)
      expect(@pet.sex).to include('male' || 'female')
    end
  end

  describe "class methods" do
    it "can provide avg_age, adoptable_count and adopted_count" do
      pet = @shelter.pets.create!(adoptable: true, name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      expect(Pet.adoptable_count).to eq(1)
      expect(Pet.adopted_count).to eq(0)
      expect(Pet.avg_age.round(1)).to eq(3)
    end

    it "can search, can provide pending_apps, and provide action_required" do
    end
  end
end
