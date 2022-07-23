class ShiftsCreator
  def initialize(service)
    @service = service
    @start_date = service.start_date
    @end_date = service.end_date
    @settings_per_day = service.settings_per_day.with_indifferent_access
  end

  def call
    (@start_date..@end_date).each do |day|
      hours_selected = @settings_per_day[day.wday.to_s]

      create_service_day(day: day, hours_selected: hours_selected)
    end
    { success: true }
  rescue StandardError => e
    Rails.logger.info("ERROR: #{self.class.name}##{__method__} - #{e.message}\nBUGTRACE: #{e.backtrace}")
    { success: false }
  end

  private

  def create_service_day(day:, hours_selected:)
    start_hour = day.to_datetime.change({ hour: hours_selected[:start_at] })
    end_hour = day.to_datetime.change({ hour: hours_selected[:end_at] })

    service_day = @service.service_days.create(
      date: day,
      start_hour: start_hour,
      end_hour: end_hour
    )

    create_service_hours(service_day: service_day, day: day)
  end

  def create_service_hours(service_day:, day:)
    (service_day.start_hour.hour..service_day.end_hour.hour).each do |hour|
      service_day.service_hours.create(
        hour: day.to_datetime.change({ hour: hour })
      )
    end
  end
end
