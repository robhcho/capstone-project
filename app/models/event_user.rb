class EventUser < ApplicationRecord
  belongs_to :event, optional:
  belongs_to :user
end
