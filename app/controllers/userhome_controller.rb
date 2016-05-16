class UserhomeController < ApplicationController
  before_action :authenticate_user!

  def show 
      @partail_name = 'info' if @partail_name.blank?
  end

  def edit_info
      @partail_name = 'edit_info'
      @current_user = User.find(params[:id])
      render action: :show
  end

  def update_info
      @partail_name = 'info'
      user = User.find(params[:id])
      if user.update(user_params)
        render action: :show
      else
        render action: :show, :notice => 'Update faild!'
      end
  end

  def password 
      @partail_name = 'password'
      @user = User.find(params[:id])
      render action: :show 
  end
  
  def orders
      @partail_name = 'orders'
      render action: :show
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update(user_password_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path, :notice => '修改成功!'
    else
      render 'password' , :notice => '修改失败!请稍后重试!'
    end
  end

  private

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  private
  def user_edit_params
    params[:user].permit(:nickname, :phone, :address, :password, :password_confirmation)
  end
end
