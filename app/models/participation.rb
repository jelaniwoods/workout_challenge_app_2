class Participation < ApplicationRecord
  # Direct associations

  belongs_to :team

  belongs_to :challenge

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
