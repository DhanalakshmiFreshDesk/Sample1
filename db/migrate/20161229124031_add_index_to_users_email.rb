class AddIndexToUserEmail < ActiveRecord::Migration
  def change
		add_index :user, :email_id, unique: true 
  	end
end
