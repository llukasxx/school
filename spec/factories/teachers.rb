FactoryGirl.define do
  factory :teacher do
    first_name "Tomasz"
    last_name "Nowak"
    email    "teacher@gmail.com"
    password "password"
    password_confirmation "password"
  end

end
