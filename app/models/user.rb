class User < ApplicationRecord
  has_many :group_users
  has_many :messages
  has_many :groups,throuth: :group_users
end
