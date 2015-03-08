require 'test_helper'

class Api::OfficeAttendanceControllerTest < ActionController::TestCase

  test 'should update attendance' do
    user = User.create(user_name: 'steve', usually_attends_office: false, usual_arrival_time: Time.parse('12:00 pm'))
    assert_difference('OfficeAttendance.count') do
      post :create, user_name: 'steve', text: 'yes'
    end
    assert_response :success
    office_attendance = OfficeAttendance.last
    assert_equal(office_attendance.attending_office, true)
    assert_equal(office_attendance.arriving_time, user.usual_arrival_time)
  end

end