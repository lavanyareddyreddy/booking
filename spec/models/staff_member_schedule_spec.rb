require 'rails_helper'

describe StaffMemberSchedule do
  before do
    new_time = Time.local(2018, 2, 9)
    Timecop.freeze(new_time)
  end

  after do
    Timecop.return
  end

  subject { schedule.openings.count }

  context 'with default staff member schedule' do
    let(:schedule) { StaffMemberSchedule.new(since: 3.day.from_now, till: 5.days.from_now, staff_member: StaffMember.new, duration: 45.minutes) }
    
    it 'returns available openings' do
      expect(subject).to eq(24)
    end
  end

  context 'with custom weekday staff member schedule' do
    let(:schedule) { StaffMemberSchedule.new(since: 3.day.from_now, till: 5.days.from_now, staff_member: StaffMember.new(custom_opening_hour: '9:00', custom_closing_hour: '16:00'), duration: 45.minutes) }

    it 'returns available openings' do
      expect(subject).to eq(18)
    end
  end

  context 'with custom weekend staff member schedule' do
    let(:schedule) { StaffMemberSchedule.new(since: Time.local(2018, 2, 9), till: Time.local(2018, 2, 10), staff_member: StaffMember.new(custom_opening_hour: '9:00', custom_closing_hour: '16:00', custom_weekend_opening_hour: '8:00', custom_weekend_closing_hour: '12:00'), duration: 45.minutes) }

    it 'returns available openings' do
      expect(subject).to eq(9)
    end
  end
end
