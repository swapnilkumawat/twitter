class SessionsController < ApplicationController

  def new
    if current_user.present?
      flash[:alert] = "You are already logged in."
      redirect_to root_path
    end
  end

  def create
    @user = User.where('username = ? or email = ?', params[:login], params[:login]).first
    flash.now[:alert] = 'Invalid Username or Email' if @user.nil?
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] ||= 'Invalid Password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end

end
