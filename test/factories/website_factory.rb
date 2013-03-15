include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :website, class: Website do
    name   "TestWebsite"
    sequence(:folder){|n|  "aFolder#{n}" }
    files { fixture_file_upload(Rails.root.join('test','fixtures','testWebsite.zip').to_s, 'application/zip') }
  end

  factory :website_with_a_folder_zipped, class: Website do
    name   "TestWebsite"
    sequence(:folder){|n|  "anotherFolder#{n}" }
    files { fixture_file_upload(Rails.root.join('test','fixtures','oneFolderZipped.zip').to_s, 'application/zip') }
  end
end
