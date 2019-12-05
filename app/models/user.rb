class User < ApplicationRecord
  has_many :tasks

  has_secure_password
  has_secure_token :api_token

  validates :name, presence: true
  validates :account_id, presence: true, uniqueness: true
end
