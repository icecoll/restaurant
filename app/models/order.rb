class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user

  PAYMENT_TYPE = %w{餐到支付 支付宝支付}
  ORDER_STATUS = %w{已下单 已接单 配送中 完成}
  validates :name, :pay_type, :address, :phone, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPE

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
