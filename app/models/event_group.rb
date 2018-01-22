class EventGroup < ApplicationRecord
  belongs_to :group
  belongs_to :event, optional: true
end
