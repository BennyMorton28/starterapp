class User < ApplicationRecord
  # Adds methods to set and authenticate against a BCrypt password.
  has_secure_password
end
