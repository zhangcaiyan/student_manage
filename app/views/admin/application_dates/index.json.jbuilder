json.array!(@application_dates) do |application_date|
  json.extract! application_date, :id, :start_at, :end_at
  json.url application_date_url(application_date, format: :json)
end
