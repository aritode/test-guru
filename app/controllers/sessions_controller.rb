class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
    end
    redirect_to tests_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Log out successful!'
  end

end
