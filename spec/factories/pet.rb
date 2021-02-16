FactoryBot.define do
  factory :pet do
    image {Faker::Avatar.image}
    name {Faker::Name.unique.name}
    description {Faker::Artist.name}
    approximate_age {Faker::Number.number(digits: 2)}
    sex {[:male, :female].sample}
  end
end
