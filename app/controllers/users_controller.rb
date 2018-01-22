class UsersController < ApplicationController
  def create
    user = User.new(
      full_name: params[:full_name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { status: 'User has been created' }
    else
      render json: { error: user.errors.full_messages }
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: { status: 'User has been deleted'}
  end
end
