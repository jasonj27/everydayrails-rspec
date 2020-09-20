json.extract! task, :id, :name, :completed, :project_id, :created_at, :updated_at
json.url project_task_url ([task.project, task], format: :json)
