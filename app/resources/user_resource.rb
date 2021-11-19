class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :is_premium, :boolean
  attribute :profile_picture, :string
  attribute :bio, :string
  attribute :username, :string

  # Direct associations

  has_many   :privileges

  # Indirect associations

end
