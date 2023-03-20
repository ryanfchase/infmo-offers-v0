class UsersController < ApplicationController
  before_action :redirect_if_signed_in, only: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the site, #{user_params[:first_name]}!"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      redirect_back(fallback_location: signin_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :birthdate, :password, :gender, :password_confirmation)
  end

  # def redirect_if_signed_in
  #   redirect_to root_path if signed_in?
  # end

end