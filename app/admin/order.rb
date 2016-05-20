ActiveAdmin.register Order do
  menu priority: 2, label: '订单'
  permit_params :name,:address,:phone,:pay_type, :status, :line_items

  index do
    id_column
    column '顾客名称', :name
    column '配送地址', :address
    column '联系电话', :phone
    column '支付方式', :pay_type
    column '下单时间', :created_at
    column '订单状态', :status
    actions do |order|
      case order.status
          when Order::ORDER_STATUS[0] #order.status == '已下单' ?
            link_to '接受订单', accept_admin_order_path(order.id), method: :post
          when Order::ORDER_STATUS[1] #order.status == '已接单' ?
            link_to '开始配送', delivery_admin_order_path(order.id), method: :post
          when Order::ORDER_STATUS[2] #order.status == '配送中' ?
            link_to '完成订单', complete_admin_order_path(order.id), method: :post
      end
    end
  end

  member_action :accept, method: :post do
    order = Order.find(params[:id])
    if order
      order.update(status: Order::ORDER_STATUS[1])#order.status == '已接单'
      redirect_to admin_orders_path
    end
  end

  member_action :delivery, method: :post do
    order = Order.find(params[:id])
    if order
      order.update(status: Order::ORDER_STATUS[2])#order.status == '配送中'
      redirect_to admin_orders_path
    end
  end

  member_action :complete, method: :post do
    order = Order.find(params[:id])
    if order
      order.update(status: Order::ORDER_STATUS[3])#order.status == '已完成'
      redirect_to admin_orders_path
    end
  end

end
