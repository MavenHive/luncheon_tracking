class OfficeAttendance < ActiveRecord::Base
  belongs_to :user

  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day)}
end