class OccurrencesController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      occurrences = Occurrence.all
      render json: occurrences.as_json
    else
      render json: []
  end

  def create
    # occurrence = Occurrence.new(
      # date: Date.strptime(params[:date], '%Y-%b-%d'),
      # start_time: Time.strptime(params[:start_time], "%l:%M %p"),
      # end_time: Time.strptime(params[:start_time], "%l:%M %p")
      )
    occurrence.save
    render json: occurrence.as_json
  end
end
