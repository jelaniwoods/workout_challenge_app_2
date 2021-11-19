class Team < ApplicationRecord
  # Direct associations

  belongs_to :challenge

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    team_name
  end

end
