json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :department_id, :doctor_id, :date_of_appointment, :time_of_appointment
  json.url appointment_url(appointment, format: :json)
end
