class AddUserReferenceToPhotoworkouts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :photoworkouts, :users
    add_index :photoworkouts, :user_id
    change_column_null :photoworkouts, :user_id, false
  end
end
