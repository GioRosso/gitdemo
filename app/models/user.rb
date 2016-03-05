class User < ActiveRecord::Base
    
    has_secure_password
    
    validates_presence_of :username, :email
    
    
  # scope :with_email, ->(email){ where("email = ?", email) }
  # scope :with_username, ->(username){ where("username = ?", username) }
  # scope :with_email_and_username, ->(email, username){ with_email(email).with_username(username).first }
    
end