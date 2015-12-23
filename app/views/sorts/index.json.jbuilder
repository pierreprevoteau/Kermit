json.array!(@sorts) do |sort|
  json.extract! sort, :id, :title, :icon
  json.url sort_url(sort, format: :json)
end
