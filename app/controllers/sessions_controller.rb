class SessionsController < ApplicationController
  layout "layouts/landinglayout", only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.id
      session[:guest] = nil
      redirect_to cocktails_path
    else
      redirect_to login_path
    end
  end

  def guest_create
    session[:guest] = true
    redirect_to cocktails_path
  end

  def destroy
    session[:current_user_id] = nil
    session[:guest] = nil
    redirect_to login_path
  end
end
