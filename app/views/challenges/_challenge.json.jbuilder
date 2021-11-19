json.extract! challenge, :id, :starting_time, :ending_time, :challenge_name, :challenge_image, :removal_policy, :new_user_policy, :penalty_policy, :workout_perday_policy, :workout_criteria, :prize_policy, :challenge_handle, :number_of_teams, :created_at, :updated_at
json.url challenge_url(challenge, format: :json)
