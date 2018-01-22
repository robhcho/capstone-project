class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  def as_json
    {
      id: id,
      group_title: group.group_title
    }
  end
end
