class UsersController < ApplicationController

  def new
    @user = User.new(name: cookies[:name])
  end

  def create
    @user = User.new(user_params)
    if User.where(email: @user.email).count > 0
      flash[:error] = "We already have this email address!"
      redirect_to new_user_path
    elsif @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're registered!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Fill out all information"
      redirect_to new_user_path
    end
  end

    def show
      @user = User.find(params[:id])
    end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
