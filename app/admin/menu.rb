  ActiveAdmin.register Menu do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  menu :priority => 2, :label => "菜单"

  permit_params :name, :description,:price,:image


=begin
  index :as => :grid do |menu|
    div do
      a :href => admin_menu_path(menu) do
        image_tag("products/" + menu.image)
      end
    end
    a truncate(menu.name), :href => admin_menu_path(menu)
  end
=end
=begin

  show :title => ""

  sidebar :product_stats, :only => :show do
    attributes_table_for resource do
      row("Total Sold")  { Order.find_with_product(resource).count }
      row("Dollar Value"){ number_to_currency LineItem.where(:product_id => resource.id).sum(:price) }
    end
  end

  sidebar :recent_orders, :only => :show do
    Order.find_with_product(resource).limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag("br")).html_safe
  end

  sidebar "Active Admin Demo" do
    render('/admin/sidebar_links', :model => 'products')
  end
=end


end
