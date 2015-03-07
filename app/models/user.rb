class User < ActiveRecord::Base
  has_many :office_attendances
end
