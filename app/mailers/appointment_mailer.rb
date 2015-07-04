class AppointmentMailer < ApplicationMailer
  default from: "noreplay@autobyte.com"

  def sample_email(user,appointment)
    @user = user
    @appointment=appointment
    mail(to: @user.email, subject: 'appointment confirmation')
  end
end
