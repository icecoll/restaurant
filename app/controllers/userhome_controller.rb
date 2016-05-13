class UserhomeController < ApplicationController
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
      render action: :show 
  end
  
  def orders
      @partail_name = 'orders'
      render action: :show
  end

  private
  def user_params
      params[:user].permit(:nickname, :phone, :address)
  end
end
