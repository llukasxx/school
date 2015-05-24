FactoryGirl.define do
  factory :student do
    first_name "John"
    last_name  "Doe"
    email "student@gmail.com"
    password "password"
    password_confirmation "password"
  end

end
