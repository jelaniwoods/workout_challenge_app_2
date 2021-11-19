json.extract! user, :id, :is_premium, :profile_picture, :bio, :username, :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt