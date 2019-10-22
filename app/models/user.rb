class User < ActiveRecord::Base

  has_secure_password

  validates :name, :last_name, :password_digest,:password_confirmation, presence: true
  validates :password_digest , length: { minimum: 3 } 
  validates :email, presence: true, uniqueness: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password) 
     user
    end
  end
  
end


