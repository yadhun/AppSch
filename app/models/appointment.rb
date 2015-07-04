class Appointment < ActiveRecord::Base
  belongs_to :department
  belongs_to :doctor
end
