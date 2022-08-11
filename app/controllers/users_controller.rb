class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to user_path
    else
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
    @books = User.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to user_path
  end

    private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :title, :body)
  end

end
