ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


  permit_params :first_name, :last_name, :email, :updated_at, :doctorstatus

  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :email
    column :updated_at
    column :created_at
    column :doctorstatus
    column :admin
    actions
  end

  form do |f|
    f.inputs "Identity" do
      f.input :last_name
      f.input :first_name
      f.input :email
      f.input :doctorstatus
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end
end
