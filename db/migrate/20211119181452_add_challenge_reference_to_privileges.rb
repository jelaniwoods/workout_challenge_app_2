class AddChallengeReferenceToPrivileges < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :privileges, :challenges
    add_index :privileges, :challenge_id
    change_column_null :privileges, :challenge_id, false
  end
end
