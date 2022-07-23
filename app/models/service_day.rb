class ServiceDay < ApplicationRecord
  has_many :service_hours
  belongs_to :service

  validates :date, :start_hour, :end_hour, presence: true
  validates :start_hour, comparison: { less_than: :end_hour }
end
