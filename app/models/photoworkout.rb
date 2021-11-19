class Photoworkout < ApplicationRecord
  mount_uploader :photo_locator, PhotoLocatorUploader

  # Direct associations

  belongs_to :challenge

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    caption
  end
end
