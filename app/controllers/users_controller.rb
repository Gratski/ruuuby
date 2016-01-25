class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save then
      flash[:notice] = "User registed successfully"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Error registering user"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :gender)
  end

end