class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to(cookies.delete(:intended_url) || tests_path)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Log out successful!'
  end

end
