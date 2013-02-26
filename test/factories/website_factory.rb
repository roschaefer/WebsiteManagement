include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :website do
    name   "MyWebsite"
    folder "myWebsite"
  end

  factory :website_with_data, class: Website do
    name   "DataWebsite"
    folder ""
    files { fixture_file_upload(Rails.root.join('test','fixtures','testWebsite.zip').to_s, 'application/zip') }
  end
end
