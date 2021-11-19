class PhotoworkoutResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :caption, :string
  attribute :challenge_id, :integer
  attribute :user_id, :integer
  attribute :likes_count, :integer
  attribute :photo_locator, :string
  attribute :calories, :integer
  attribute :main_exercise, :string

  # Direct associations

  belongs_to :challenge

  belongs_to :user

  # Indirect associations

end
