json.extract! bill, :id, :doctor_id, :patient_id, :body, :total, :created_at, :updated_at
json.url bill_url(bill, format: :json)
