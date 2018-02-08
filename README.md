# README

schedule = StaffMemberSchedule.new(since: 1.day.from_now, till: 2.days.from_now, staff_member: StaffMember.new, duration: 45.minutes);
schedule.openings

Running the code above in the console will return chunks of 45 min intervals from to date
starting from 10 till 19

1. Extend the code to support configurable different opening hours for per staff member
2. Allow support for different hours in the weekend


1. `custom_opening_hour` and `custom_closing_hour` can be used to configure different opening hours per staff member 

`schedule = StaffMemberSchedule.new(since: 1.day.from_now, till: 2.days.from_now, staff_member: StaffMember.new(custom_opening_hour: '9:00', custom_closing_hour: '16:00'), duration: 45.minutes); schedule.openings`

2. `custom_weekend_opening_hour` and `custom_weekend_closing_hour` can be used to configure different hours for weekends

`schedule = StaffMemberSchedule.new(since: 1.day.from_now, till: 2.days.from_now, staff_member: StaffMember.new(custom_opening_hour: '9:00', custom_closing_hour: '16:00', custom_weekend_opening_hour: '8:00', custom_weekend_closing_hour: '12:00'), duration: 45.minutes); schedule.openings`
