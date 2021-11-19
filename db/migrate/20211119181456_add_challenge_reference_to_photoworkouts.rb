class AddChallengeReferenceToPhotoworkouts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :photoworkouts, :challenges
    add_index :photoworkouts, :challenge_id
    change_column_null :photoworkouts, :challenge_id, false
  end
end
