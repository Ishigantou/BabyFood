class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :profile, notice: 'Signed up!'
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to :profile, notice: 'Updated!'
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :baby_birthday)
  end
end
