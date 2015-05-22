FactoryGirl.define do
  factory :admin_worker do
    name "John"
    surname  "Doe"
    email "example@gmail.com"
    password "password"
    password_confirmation "password"
  end
end
