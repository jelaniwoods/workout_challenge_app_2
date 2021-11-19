class Challenge < ApplicationRecord
  # Direct associations

  has_many   :participations,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    starting_time
  end

end
