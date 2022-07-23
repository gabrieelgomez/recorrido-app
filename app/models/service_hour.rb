class ServiceHour < ApplicationRecord
  belongs_to :service_day
  belongs_to :employee, optional: true

  validates :hour, presence: true

  broadcasts_to ->(_service_hour) { :service_hours }
end
