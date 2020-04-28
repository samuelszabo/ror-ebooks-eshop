json.extract! order, :id, :user_id, :address_id, :paid, :state, :created_at, :updated_at
json.url order_url(order, format: :json)
