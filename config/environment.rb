# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


Resturant::Application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
      :address => 'smpt.qq.com',
      :port    => 587,
      :domain  => 'domian.of.sender.net',
      :authentication => 'plain',
      :user_name => 'dave',
      :password => 'test',
      :enable_starttls_auto => true
  }
end