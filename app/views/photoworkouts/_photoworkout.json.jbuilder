json.extract! photoworkout, :id, :caption, :challenge_id, :user_id, :likes_count, :photo_locator, :calories, :main_exercise, :created_at, :updated_at
json.url photoworkout_url(photoworkout, format: :json)
