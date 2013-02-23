ActiveAdmin.register Website do
  form(:html => {:multipart => true}) do |f|
    f.inputs "Details" do
      f.input :name
      f.input :folder
      f.input :files, :as => :file
    end
  f.buttons
  end
end
