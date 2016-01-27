json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :title, :kind, :active, :storage_folder, :db_folder, :transcode_id
  json.url workflow_url(workflow, format: :json)
end
