class User < ActiveRecord::Base
	has_many :pets
 # Tell rails to encrypt the password in		   # Tell rails to encrypt the password in
 # password_digest column		+  # password_digest column.
  has_secure_password
 # It also checks password == password_confirmation
 # when saving
 # Also provides the @user.authenticate() method
end
