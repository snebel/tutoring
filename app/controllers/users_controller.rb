class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index]

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_back_or root_url
    else
      render 'new'
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end

  def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in to access this page."
       unless signed_in?
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
end
