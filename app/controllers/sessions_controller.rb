class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(user_name: params[:session][:user_name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid user name or password"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    sign_out
    cookies.delete(:elegible_only)
    redirect_to root_url
  end

  private

  # def redirect_signed_in_user
  #   redirect_to root_path if signed_in?
  # end

end
