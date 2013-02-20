FactoryGirl.define do
  factory :user do
    name                  "Bob"
    sequence(:email){|n|  "user#{n}@factory.com" }
    role                  "client"
    password              "secret1234"
    password_confirmation "secret1234"
    #after(:create) do |user|
      #user.confirm!
    #end                  # avoid email confirmation in test development
    confirmed_at          Time.now
  end
end
