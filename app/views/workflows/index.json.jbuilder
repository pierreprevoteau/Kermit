json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :title, :type, :active, :path, :folder_id
  json.url workflow_url(workflow, format: :json)
end
