class User < ApplicationRecord
  belongs_to :occurrences
  has_many :event_users
  has_many :events, through: :ever_users
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :votes
  has_many :polls, through: :votes
end
