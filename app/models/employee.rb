class Employee < ApplicationRecord
  has_many :service_hours
  belongs_to :company

  validates :name, presence: true
end
