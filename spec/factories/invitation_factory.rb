FactoryGirl.define do
  factory :invitation do
    email Faker::Internet.email

    trait :available do
      available true
    end

    factory :invitation_available, traits: [:available]
  end
end
