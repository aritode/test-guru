class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      redirect_to tests_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Log out successful!'
  end

end
