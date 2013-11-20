json.array!(@customers) do |customer|
  json.extract! customer, :nif, :name
  json.url customer_url(customer, format: :json)
end
