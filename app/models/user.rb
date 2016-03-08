class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :database_authenticatable,:authentication_keys => [:phone]
  def email_required?
    false
  end
end
