ActiveAdmin.register Website do
  form(:html => {:multipart => true}) do |f|
    f.inputs "Details" do
      f.input :user
      f.input :name
      f.input :files, :as => :file
    end
  f.actions
  end
end
