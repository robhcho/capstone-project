class GroupsController < ApplicationController
  def create
    group = group.new(group_title: params[:group_title])
    group.save
    render json: group.as_json
  end
end
