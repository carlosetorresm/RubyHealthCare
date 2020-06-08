json.extract! prescription, :id, :doctor_id, :patient_id, :consult_type_id, :body, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
