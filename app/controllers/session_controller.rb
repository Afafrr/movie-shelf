class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email].to_s.strip.downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to watchlist_items_path, notice: :success
    else
      flash.now[:alert] = "Wrong credentials"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, alert: "Logged out"
  end
end
