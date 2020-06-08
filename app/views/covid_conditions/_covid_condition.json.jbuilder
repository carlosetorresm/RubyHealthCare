json.extract! covid_condition, :id, :patient_id, :condition_id, :created_at, :updated_at
json.url covid_condition_url(covid_condition, format: :json)
