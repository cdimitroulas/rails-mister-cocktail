class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_login
    unless session[:current_user_id] || session[:guest]
      redirect_to login_path
    end
  end

  def set_user
    @user = User.find_by_id(session[:current_user_id])
    @user ||= User.new
  end
end
