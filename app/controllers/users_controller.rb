  class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
 
  def index

    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { @user.to_json }
      end
    end

  def create
  @user = User.new(user_params)
   respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'test.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

def new
  @user = User.new
  render :new
end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'user was removed' }
      format.json { head :no_content }
    end
  end

  def set_user

    @user = User.find(params[:id])

  end

  def user_params
      params.require(:user).permit(:username, :password) 
  end
  
end
