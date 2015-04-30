class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.build(user_params)
  end
  def index
  end
  def show
  end

  def edit
  end
  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end



end
