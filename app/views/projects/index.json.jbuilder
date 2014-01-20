json.array!(@projects) do |project|
  json.extract! project, :name, :description, :state, :start_date, :end_date
  json.url project_url(project, format: :json)
end
