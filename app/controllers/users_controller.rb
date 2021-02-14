class UsersController < ApplicationController

  def new
    if current_user.present?
      flash[:alert] = "You are already logged in."
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Signed up successfully.'
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @tweets = @user.tweets.order(updated_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end

end
