json.array!(@media) do |medium|
  json.extract! medium, :id, :title, :sort_id, :state_id, :created_by, :updated_by, :tag_id
  json.url medium_url(medium, format: :json)
end
