class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.new?
      @user.new = false
    end
    if @user.update_attributes(params[:user])
      redirect_to root_path
      flash[:notice] = "Updated successfully."
    else
      redirect_to root_path
    end
  end

end
