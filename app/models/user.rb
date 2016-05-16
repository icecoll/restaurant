class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :database_authenticatable,:authentication_keys => [:phone]

  def add_order_2_User(order)
    orders << order
  end

  def email_required?
    false
  end
end
