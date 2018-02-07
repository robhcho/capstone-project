class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  has_many :event_groups
  has_many :groups, through: :event_groups
  # belongs_to :groups
  has_many :polls
end


def as_json
  {
    id: id,
    user_id: current_user.id,
    event_title: event_title,
    event_date: event_date,
    event_duration: event_duration,
    event_description: event_description,

  }
end

# def event_date
  
# end
