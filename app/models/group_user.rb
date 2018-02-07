class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  def as_json
    {
      id: id,
      group_id: group_id,
      group_title: group.group_title,
      members: group_members,
      # group_calendar_events: group_calendar
    }
  end

  def group_members
    group_members_array = []
    group_members = GroupUser.where(group_id: 1)
    group_members.each do |group_member|
      group_members_array << group_member.user.full_name
      # p group_member.user.user_calendar_events
    end
    return group_members_array
  end

  # def group_calendar
  #   group_calendar_events = Group.find_by(id: params[:id]).users.user_calendar_events
  #   return group_calendar_events
  # end
end
