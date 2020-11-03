json.extract! product, :id, :name, :cost, :created_at, :updated_at
json.url product_url(product, format: :json)
