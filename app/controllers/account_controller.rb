class AccountController < Devise::RegistrationsController
  protect_from_forgery


  before_filter :configure_permitted_parameters

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:nickname, :phone,
               :address ,:password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:nickname,:phone,:password, :password_confirmation, :current_password)
    end

  end

  def edit
    @user = current_user
    # 首次生成用户 Token
    @user.ensure_private_token!
  end

  def update
    super
  end


  def destroy
    current_password = params[:user][:current_password]

    if current_user.valid_password?(current_password)
      resource.soft_delete
      sign_out
      redirect_to root_path
      set_flash_message :notice, :destroyed
    else
      current_user.errors.add(:current_password, :invalid)
      render 'edit'
    end
  end
end
