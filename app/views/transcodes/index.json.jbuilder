json.array!(@transcodes) do |transcode|
  json.extract! transcode, :id, :title, :profile
  json.url transcode_url(transcode, format: :json)
end
