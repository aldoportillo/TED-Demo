json.extract! person, :id, :first_name, :last_name, :email, :github_username, :devto_username, :linkedin_url, :photo_url, :created_at, :updated_at
json.url person_url(person, format: :json)
