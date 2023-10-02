class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create] # Allow non-authenticated users to access registration

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user) # Automatically log in the user after registration
      redirect_to root_path, notice: 'Welcome! You have successfully signed up.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
