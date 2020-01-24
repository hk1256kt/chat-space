class Group < ApplicationRecord
  has_many :group_users
  has_many :users
  has_many :users,throuth: :group_users
end
