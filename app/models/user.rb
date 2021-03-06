class User < ActiveRecord::Base
  has_many :office_attendances

  def self.attending_office_today
    all_attendances = []
    find_each do |user|
      attendance = user.office_attendances.today.last
      all_attendances << attendance if attendance && attendance.attending_office
      if user.usually_attends_office && !attendance
        all_attendances << OfficeAttendance.new(user: user, attending_office: true, arriving_time: user.usual_arrival_time)
      end
    end
    all_attendances
  end

  def self.lunch_in_office
    all_eating_lunch = []
    attending_office_today.each do |attendance|
      user = attendance.user
      all_eating_lunch << user if user.usually_eats_in_office
    end
    all_eating_lunch
  end
end
