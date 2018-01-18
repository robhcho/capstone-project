class User < ApplicationRecord
  has_secure_password

  has_many :user_calendar_events
  has_many :event_users
  has_many :events, through: :ever_users
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :votes
  has_many :polls, through: :votes

  validates :full_name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :password, length: { in: 6..20 }

  def as_json
    {
      id: id,
      full_name: full_name,
      username: username,
      email: email
    }
  end
end
