# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    AppointmentMailer.sample_email(User.first)
  end

end
