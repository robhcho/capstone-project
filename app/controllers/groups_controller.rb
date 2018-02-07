class GroupsController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      user_groups = current_user.groups
      render json: user_groups.as_json
    else
      render json: []
    end
  end

  # def show
  #   group_users = Group.where(group_id: 1)
  #   group_users.each do |group_user|
  #     return group_user.user.full_name
  #   end
  #   render json: group_user.as_json
  #   # user_group = Group.find(:id)
  #   # render json: user_group.as_json
  # end

  def create
    group = Group.new(
      user_id: current_user.id,
      group_title: params[:group_title]
    )
    if group.save
      render json: group.as_json
    else
      render json: { error: group.errors.full_messages }
    end
  end
end
