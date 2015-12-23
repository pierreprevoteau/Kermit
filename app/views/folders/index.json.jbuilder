json.array!(@folders) do |folder|
  json.extract! folder, :id, :title, :parent
  json.url folder_url(folder, format: :json)
end
