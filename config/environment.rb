# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


Resturant::Application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
      :address => 'smpt.163.com',
      :port    => 25,
      :domain  => 'www.163.com',
      :authentication => :login,
      :user_name => '18370992726@163.com',
      :password => '790372365',
      :enable_starttls_auto => true
  }
end
