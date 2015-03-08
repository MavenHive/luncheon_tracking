class OfficeAttendancesController < ApplicationController
  def index
    @attending_office = User.attending_office_today
    @lunch_in_office = User.lunch_in_office
  end
end