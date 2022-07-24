FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    association :company
  end
end
