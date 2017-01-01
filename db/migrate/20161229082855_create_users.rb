class CreateUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :user_name
      t.string :email_id

      t.timestamps
    end
  end
end
