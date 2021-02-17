FactoryBot.define do
  factory :user_application do
    name {Faker::Name.unique.name}
    address {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state_abbr}
    zip {80234}
    description {Faker::Artist.name}
  end
end
