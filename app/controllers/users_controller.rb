class UsersController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tests_path, notice: 'Thanks for signing up!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
  end

end
