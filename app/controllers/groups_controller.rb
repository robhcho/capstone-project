class GroupsController < ApplicationController
  def index
    if current_user
      user_groups = Group.all
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
    group = group.new(
      user_id: current_user.id,
      group_title: params[:group_title]
    )
    group.save
    render json: group.as_json
  end
end
