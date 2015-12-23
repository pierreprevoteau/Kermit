json.array!(@media) do |medium|
  json.extract! medium, :id, :title, :sort_id, :state_id, :folder_id, :duration, :created_by, :updated_by, :tag
  json.url medium_url(medium, format: :json)
end
