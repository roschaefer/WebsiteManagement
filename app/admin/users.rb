ActiveAdmin.register User do
  random_password = SecureRandom.hex(12)
  form do |f|
    f.inputs "Details" do
      f.input  :name
      f.input  :email
      if f.object.new_record?
        f.input  :password, :as => :hidden, :input_html => { :value => random_password}
        f.input  :password_confirmation, :as => :hidden, :input_html => { :value => random_password}
      end
      f.input :role, :as => :select, :collection => User::ROLES
    end
  f.actions
  end
end
