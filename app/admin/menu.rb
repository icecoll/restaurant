ActiveAdmin.register Food do
  menu priority: 2, label: '菜单'
  permit_params :name,:price,:image,:description

  index do
    id_column
    column  '名称', :name
    column  '单价', :price
    column  '描述', :description
    column  '创建时间', :created_at
    actions
  end

  filter :price, as: :string, label: '单价'

end
