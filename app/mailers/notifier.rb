class Notifier < ApplicationMailer
default :from => "Andy Li <andyli@example.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_recivied.subject
  #
  def order_received(order)
    @order = order
    mail to: '790372365@qq.com', subject: 'order comfirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    @order = order
    mail to: "790372365@qq.com", subject: 'New order'
  end
end
