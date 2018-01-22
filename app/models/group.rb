class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :event_groups
  has_many :events, through: :event_groups

  def user
    User.find_by(id: user_id)
  end
end
