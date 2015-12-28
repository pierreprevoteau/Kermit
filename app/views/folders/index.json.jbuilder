json.array!(@folders) do |folder|
  json.extract! folder, :id, :title, :parent_id
  json.url folder_url(folder, format: :json)
end
