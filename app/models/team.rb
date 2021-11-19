class Team < ApplicationRecord
  mount_uploader :team_picture, TeamPictureUploader

  # Direct associations

  has_many   :participations,
             dependent: :destroy

  belongs_to :challenge

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    team_name
  end
end
