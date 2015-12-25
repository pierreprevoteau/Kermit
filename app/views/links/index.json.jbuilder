json.array!(@links) do |link|
  json.extract! link, :id, :medium_id, :folder_id
  json.url link_url(link, format: :json)
end
