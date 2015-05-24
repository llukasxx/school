FactoryGirl.define do
  factory :admin do
    first_name "Adam"
    last_name "Kowalsky"
    email "admin@gmail.com"
    password "password"
    password_confirmation "password"
  end

end
