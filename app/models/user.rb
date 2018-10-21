class User < ApplicationRecord
  has_secure_password

  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :chats, through: :subscriptions
end
