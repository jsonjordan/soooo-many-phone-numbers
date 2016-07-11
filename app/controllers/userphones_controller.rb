class UserphonesController < ApplicationController
  def new
    @user_phones = UserphoneForm.new
  end

  def create
    raise
    @user_phones = UserphoneForm.new userphones_params
    if @user_phones.save
      redirect_to root_path, notice: "User and Phone numbers saved"
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def userphones_params
    params.require(:userphone_form).permit(:username, :phones)
  end
end
