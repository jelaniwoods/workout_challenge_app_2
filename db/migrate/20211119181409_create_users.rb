class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :is_premium
      t.string :profile_picture
      t.text :bio
      t.string :username

      t.timestamps
    end
  end
end
