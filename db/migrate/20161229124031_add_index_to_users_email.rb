class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
		add_index :users, :email_id, unique: true 
  	end
end
