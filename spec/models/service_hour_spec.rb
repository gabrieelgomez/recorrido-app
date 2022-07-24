require 'rails_helper'

RSpec.describe ServiceHour, type: :model do
  it { should validate_presence_of(:hour) }
  it { should belong_to(:service_day) }
end
