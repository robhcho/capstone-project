class GroupUsersController < ApplicationController
  def index
    p current_user
    user_groups = GroupUser.where(user_id: current_user.id)
    render json: user_groups.as_json
  end

  def show
    group_members = Group.find_by(id: params[:id]).users
    render json: group_members.as_json
  end

  def create
    user_group = GroupUser.new(
      user_id: current_user.id,
      group_id: params[:group_id]
    )
    user_group.save
    render json: user_group.as_json
  end
  
  def destroy
    group = GroupUser.find(params[:id])
    group.destroy

    render json: { message: 'You have left the group' }
  end

  def group_calendar
    group_calendar_events = []
    group_members = Group.find_by(id: params[:id]).users
    
    group_members.each do |group_member|
      group_calendar_events << group_member.user_calendar_events
    end

    render json: group_calendar_events.as_json
  end
end
