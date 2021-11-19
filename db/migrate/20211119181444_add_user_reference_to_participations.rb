class AddUserReferenceToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :participations, :users
    add_index :participations, :user_id
    change_column_null :participations, :user_id, false
  end
end
