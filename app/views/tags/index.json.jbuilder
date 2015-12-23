json.array!(@tags) do |tag|
  json.extract! tag, :id, :title, :bg_color, :bd_color, :tx_color
  json.url tag_url(tag, format: :json)
end
