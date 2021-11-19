json.extract! team, :id, :team_name, :team_picture, :challenge_id, :created_at, :updated_at
json.url team_url(team, format: :json)
