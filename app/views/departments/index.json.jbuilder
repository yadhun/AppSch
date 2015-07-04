json.array!(@departments) do |department|
  json.extract! department, :id, :name, :morning_opens_at, :evening_opens_at
  json.url department_url(department, format: :json)
end
