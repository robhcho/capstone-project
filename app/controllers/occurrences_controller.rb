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
    occurrence = Occurrence.new(
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:start_time]
      )
    occurrence.save
    render json: occurrence.as_json
  end
end
