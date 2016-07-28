class UsersController < ApplicationController

  def show
    @user = User.find(parama[:id])
    debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(suer_params)
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      prams.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end
