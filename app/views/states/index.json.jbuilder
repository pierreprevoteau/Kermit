json.array!(@states) do |state|
  json.extract! state, :id, :title, :bd_color
  json.url state_url(state, format: :json)
end
