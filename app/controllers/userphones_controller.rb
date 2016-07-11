class UserphonesController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user_phones = UserphoneForm.new
  end

  def create
    @user_phones = UserphoneForm.new userphones_params
    if @user_phones.save
      redirect_to root_path, notice: "User and Phone numbers saved"
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user_phones = UserphoneForm.new userphones_params
    if @user_phones.save
      #dumb way of updating
      @user.phones.delete_all
      @user.delete
      @user_phones = UserphoneForm.new userphones_params
      @user_phones.save
      redirect_to root_path, notice: "Username and Phone numbers updated!"
    else
      render :edit
    end
  end

  private

  def userphones_params
    params.require(:user).permit(:username, phones: [])
  end
end
