require 'rails_helper'

RSpec.describe ServiceDay, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:start_hour) }
  it { should validate_presence_of(:end_hour) }
  it { should belong_to(:service) }
end
