class Service < ApplicationRecord
  has_many :service_days
  belongs_to :company

  validates :name, :start_date, :end_date, :settings_per_day, presence: true
  validates :start_date, comparison: { less_than: :end_date }

  def create_shifts!
    ShiftsCreator.new(self).call
  end

  def weeks
    days = (start_date..end_date).to_a

    weeks = []

    days.each_slice(7) do |w_days|
      w_days.compact!
      weeks << [
        "Semana ##{w_days.first.strftime('%U').to_i} #{w_days.first} - #{w_days.last}",
        w_days.first.to_s
      ]
    end

    weeks
  end
end
