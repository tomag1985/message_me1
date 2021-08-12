class SessionsController < ApplicationController
  before_action :check_log, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in :D'
      redirect_to root_path
    else
      flash.now[:error] = 'Wrong credentials'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out :D'
    redirect_to login_path
  end

  private

  def check_log
    redirect_to root_path if logged_in?
  end
end