class StaffMember
  include ActiveModel::Model

  DEFAULT_OPENING_HOUR = '10:00'.freeze
  DEFAULT_CLOSING_HOUR = '19:00'.freeze
  TIMEZONE = 'PST8PDT'.freeze

  def initialize **args
    @custom_opening_hour = args[:custom_opening_hour]
    @custom_closing_hour = args[:custom_closing_hour]
    @custom_weekend_opening_hour = args[:custom_weekend_opening_hour]
    @custom_weekend_closing_hour = args[:custom_weekend_closing_hour]
  end

  def events
    {}
  end

  def timezone
    Time.find_zone(TIMEZONE)
  end

  def start_work_hour__c
    @custom_opening_hour
  end

  def end_work_hour__c
    @custom_closing_hour
  end

  def start_hour
    try(:start_work_hour__c) || DEFAULT_OPENING_HOUR
  end

  def end_hour
    try(:end_work_hour__c) || DEFAULT_CLOSING_HOUR
  end

  def weekend_opening_hour
    @custom_weekend_opening_hour || DEFAULT_OPENING_HOUR
  end

  def weekend_closing_hour
    @custom_weekend_closing_hour || DEFAULT_CLOSING_HOUR
  end

  def start_hour_offset
    chronic_duration(start_hour)
  end

  def end_hour_offset
    chronic_duration(end_hour)
  end

  def weekend_start_hour_offset
    chronic_duration(weekend_opening_hour)
  end

  def weekend_end_hour_offset
    chronic_duration(weekend_closing_hour)
  end

  private
  def chronic_duration(hour)
    ChronicDuration.parse([hour, ':00'].join)
  end
end
