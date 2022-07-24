FactoryBot.define do
  factory :service do
    name { Faker::Company.bs }
    start_date { Time.now.beginning_of_week }
    end_date { Time.now.end_of_week + 5.weeks }
    settings_per_day {
      {
        1 => { start_at: 8,
               end_at: 16 },
        2 => { start_at: 8,
               end_at: 16 },
        3 => { start_at: 8,
               end_at: 16 },
        4 => { start_at: 8,
               end_at: 16 },
        5 => { start_at: 8,
               end_at: 16 },
        6 => { start_at: 8,
               end_at: 16 },
        0 => { start_at: 8,
               end_at: 16 }
      }
    }
    association :company
  end
end
