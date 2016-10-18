class UsersController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:sessions][:email], params[:sessions][:email])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end