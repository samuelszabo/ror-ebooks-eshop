json.extract! payment, :id, :order_id, :variable_symbol, :price, :state, :created_at, :updated_at
json.url payment_url(payment, format: :json)
