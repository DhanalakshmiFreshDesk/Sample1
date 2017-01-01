# == Schema Information
#
# Table name: user
#
#  id         :integer         not null, primary key
#  user_name  :string(255)
#  email_id   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email_id, :user_name, :password, :password_confirmation 
  has_secure_password
  before_save { |user| user.email_id = email_id.downcase }
  before_save :create_remember_token
  validates :user_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_id, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end
end
