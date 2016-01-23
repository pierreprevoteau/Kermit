json.array!(@technicals) do |technical|
  json.extract! technical, :id, :medium_id, :key, :value
  json.url technical_url(technical, format: :json)
end
