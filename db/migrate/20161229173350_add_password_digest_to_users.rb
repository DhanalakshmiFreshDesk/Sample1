class AddPasswordDigestToUser < ActiveRecord::Migration
  def change
    add_column :user, :password_digest, :string
  end
end
