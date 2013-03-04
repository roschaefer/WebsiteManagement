include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :website, class: Website do
    name   "TestWebsite"
    sequence(:folder){|n|  "aFolder#{n}" }
    files { fixture_file_upload(Rails.root.join('test','fixtures','testWebsite.zip').to_s, 'application/zip') }
  end
end
