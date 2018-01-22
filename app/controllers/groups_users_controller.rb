class GroupsUsersController < ApplicationController
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
end
