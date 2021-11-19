json.extract! participation, :id, :user_id, :challenge_id, :team_id,
              :created_at, :updated_at
json.url participation_url(participation, format: :json)
