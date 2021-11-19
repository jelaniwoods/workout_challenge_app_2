class AddTeamReferenceToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :participations, :teams
    add_index :participations, :team_id
    change_column_null :participations, :team_id, false
  end
end
