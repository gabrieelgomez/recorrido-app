# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

2.times do
  company = Company.create(name: Faker::Company.name)
  p "Company #{company.name} created"

  4.times do
    employee = company.employees.create(
      name: Faker::Name.name,
    )
    p "Employee #{employee.name} created"
  end

  service = company.services.create(
    name: Faker::Company.bs,
    start_date: Time.now.beginning_of_week,
    end_date: Time.now.end_of_week + 5.weeks,
    settings_per_day: {
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
  )

  service.create_shifts!
  p "#{company.name} shifts services created!"

  p '----------'
end
