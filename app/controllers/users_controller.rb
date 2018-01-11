class UsersController < ApplicationController
  def create
    user = User.new(
      full_name: params[:full_name],
      username: params[:username],
      password: params[:password],
      confirmation_password: params[:confirmation_password]
    )
    if user.save
      render json: user.as_json
    else
      render json: { error: user.errors.full_messages }
    end
  end
end
