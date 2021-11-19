class Photoworkout < ApplicationRecord
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
