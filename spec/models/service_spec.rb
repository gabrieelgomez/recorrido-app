require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:settings_per_day) }
  it { should belong_to(:company) }
end
