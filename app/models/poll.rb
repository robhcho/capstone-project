class Poll < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  belongs_to :event
end
