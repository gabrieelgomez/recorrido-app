FactoryBot.define do
  factory :company do
    name { Faker::Company.name }

    after(:create) do |company|
      4.times { create(:employee, company: company) }
    end
  end
end
