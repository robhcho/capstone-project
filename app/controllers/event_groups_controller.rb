class EventGroupsController < ApplicationController
  def create
    event_group = EventGroup.new(
      event_id: params[:id],
      group_id: params[:id]
    )
    event_group.save
    render json: event_group.as_json
  end
end
