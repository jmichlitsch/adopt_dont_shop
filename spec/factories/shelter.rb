FactoryBot.define do
  factory :shelter do
    name {Faker::Company.unique.name}
    address {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state_abbr}
    zip {Faker::Address.zip}
  end
end 
