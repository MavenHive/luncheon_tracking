module Api
  class OfficeAttendanceController < ApplicationController
    def create
      user_name = params.require('user_name')
      user = User.find_by(user_name: user_name)
      if user
        text = params.permit('text')['text']
        attending_office = (text =~ (/^(true|t|yes|y|1)$/i) ? true : false)
        OfficeAttendance.create!(user: user, attending_office: attending_office)
      end
      render nothing: true
    end
  end
end
