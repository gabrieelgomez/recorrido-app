require 'rails_helper'

RSpec.describe ShiftsCreator do
  context 'create shifts services' do
    describe '#call' do
      it 'should be create a shift services days and hours' do
        company = create(:company)
        service = create(:service, company: company)
        service.create_shifts!

        expect(service.service_days.size).to eql(42)
      end
    end
  end
end
