ActiveAdmin.register User do
  form do |f|
    f.inputs "Details" do
      f.input  :name
      f.input  :email
      f.input :role, :as => :select, :collection => User::ROLES
    end
  f.actions
  end
end
