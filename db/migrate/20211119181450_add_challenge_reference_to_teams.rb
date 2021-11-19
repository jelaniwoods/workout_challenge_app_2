class AddChallengeReferenceToTeams < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :teams, :challenges
    add_index :teams, :challenge_id
    change_column_null :teams, :challenge_id, false
  end
end
