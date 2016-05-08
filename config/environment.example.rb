# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.163.com",
    :port                 => 25,
    :domain               => "163.com",
    :user_name            => 'XXX@163.com',
    :password             => "XXX",
    :authentication       => "login"
}