class Service < ApplicationRecord
  has_many :service_days
  belongs_to :company

  validates :name, :start_date, :end_date, :settings_per_day, presence: true
  validates :start_date, comparison: { less_than: :end_date }

  def create_shifts!
    ShiftsCreator.new(self).call
  end
end
