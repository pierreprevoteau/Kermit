json.array!(@metadata) do |metadatum|
  json.extract! metadatum, :id, :media_id, :key, :value
  json.url metadatum_url(metadatum, format: :json)
end
