class Company < ApplicationRecord
  has_many :employees
  has_many :services

  validates :name, presence: true
end
