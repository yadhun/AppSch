json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :name, :available_on, :department_id
  json.url doctor_url(doctor, format: :json)
end
