ActiveAdmin.register User do
  # 允许从form添加的属性
  permit_params :name, :sex, :brithday, :password
end
