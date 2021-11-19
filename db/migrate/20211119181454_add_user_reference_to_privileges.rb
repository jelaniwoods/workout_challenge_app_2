class AddUserReferenceToPrivileges < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :privileges, :users
    add_index :privileges, :user_id
    change_column_null :privileges, :user_id, false
  end
end
