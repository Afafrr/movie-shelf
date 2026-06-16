class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    data = params.require(:user).permit(:email, :password, :password_confirmation)
    @user = User.create(data)

    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to watchlist_items_path, notice: :success
    else
      render :new, status: :unprocessable_entity
    end
  end
end
