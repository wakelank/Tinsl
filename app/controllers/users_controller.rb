class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def index
    @user = current_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end

    # User.create(user_params)
    #redirect_to log_in_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :email_confirmation)
  end



end
