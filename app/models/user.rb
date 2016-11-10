class User < ApplicationRecord
  has_many :cocktails, dependent: :destroy
  has_secure_password
end
