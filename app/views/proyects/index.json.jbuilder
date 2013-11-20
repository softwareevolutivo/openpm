json.array!(@proyects) do |proyect|
  json.extract! proyect, :name, :description, :state, :start_date, :end_date
  json.url proyect_url(proyect, format: :json)
end
