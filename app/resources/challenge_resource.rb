class ChallengeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :starting_time, :datetime
  attribute :ending_time, :string
  attribute :challenge_name, :string
  attribute :challenge_image, :string
  attribute :removal_policy, :integer
  attribute :new_user_policy, :integer
  attribute :penalty_policy, :integer
  attribute :workout_perday_policy, :integer
  attribute :workout_criteria, :integer
  attribute :prize_policy, :string
  attribute :challenge_handle, :string
  attribute :number_of_teams, :integer

  # Direct associations

  has_many   :privileges

  has_many   :photos,
             resource: PhotoworkoutResource

  has_many   :participations

  # Indirect associations

end
