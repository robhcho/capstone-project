class GroupsController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      user_groups = Group.where(user_id: current_user.id)
      render json: user_groups.as_json
    else
      render json: []
    end
  end

  def show
    user_groups = Group.find(:id)
    render json: user_groups.as_json
  end

  def create
    group = Group.new(
      # user_id: current_user.id,
      group_title: params[:group_title]
    )
    group.save
    render json: group.as_json
  end
end
