class SessionsController < ApplicationController

  def new
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      sessions[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def create
  end 
end
