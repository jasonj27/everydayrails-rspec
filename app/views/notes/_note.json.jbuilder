json.extract! note, :id, :message, :user_id, :project_id, :created_at, :updated_at
json.url note_url(note, format: :json)
