class SessionsController < Devise::SessionsController


  def new
    super
    #session['user_return_to'] = request.referrer
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end