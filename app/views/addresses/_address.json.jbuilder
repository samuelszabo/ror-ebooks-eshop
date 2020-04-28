json.extract! address, :id, :user_id, :first_name, :surname, :street, :postal_code, :city, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
