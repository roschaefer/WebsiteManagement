FactoryGirl.define do
  factory :user do
    name                  "Bob"
    email                 "bob@example.com"
    role                  "client"
    password              "secret1234"
    password_confirmation "secret1234"
    #after(:create) do |user|
      #user.confirm!
    #end
    confirmed_at          Time.now
  end


  factory :admin, :class => User do
    name                  "Admin"
    email                 "admin@example.com"
    role                  "admin"
    password              "secret1234"
    password_confirmation "secret1234"
    #after(:create) do |admin|
      #admin.confirm!
    #end
    confirmed_at          Time.now
  end
end
