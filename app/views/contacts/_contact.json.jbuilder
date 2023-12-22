json.extract! contact, :id, :name, :lastname, :email, :phone, :user_id, :country_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
