class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    set_user
  end

  def new
    @user = user.new
  end

  def create
    @user = user.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_user
  end

  def update
    if @user.update(users_params)
      redirect_to users_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:xxx, :yyy)
  end
end
