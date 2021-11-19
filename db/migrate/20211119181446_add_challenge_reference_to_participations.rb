class AddChallengeReferenceToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :participations, :challenges
    add_index :participations, :challenge_id
    change_column_null :participations, :challenge_id, false
  end
end
