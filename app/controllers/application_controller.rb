class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  stale_when_importmap_changes

  def current_user
    return @current_user if @current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_auth
    if current_user.blank?
      redirect_to login_path, alert: "Not authenticated"
    end
  end
end
