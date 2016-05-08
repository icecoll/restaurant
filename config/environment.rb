# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


# Resturant::Application.configure do
#   config.action_mailer.perform_deliveries = true
#   config.action_mailer.raise_delivery_errors = true
#   config.action_mailer.default :charset => "utf-8"
#   config.action_mailer.default_url_options = { :host => 'localhost:3000' }
#   config.action_mailer.delivery_method = :smtp
#
#   config.action_mailer.smtp_settings = {
#       :address => 'smtp.163.com',
#       :port    => 25,
#       # :domain  => '163.com',
#       :authentication => :login,
#       :user_name => '18370992726@163.com',
#       :password => '790372365',
#       # :enable_starttls_auto => true
#   }
# end
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.163.com",
    :port                 => 25,
    :domain               => "163.com",
    :user_name            => '18370992726@163.com',
    :password             => "icecol7903",
    :authentication       => "login",
    # :enable_starttls_auto => true
}