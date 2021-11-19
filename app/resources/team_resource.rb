class TeamResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :team_name, :string
  attribute :team_picture, :string
  attribute :challenge_id, :integer

  # Direct associations

  has_many   :participations

  belongs_to :challenge

  # Indirect associations
end
