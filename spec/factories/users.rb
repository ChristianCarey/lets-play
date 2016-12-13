FactoryGirl.define do
  factory :user, aliases: [:host] do
    first_name "MyString"
    last_name "MyString"
    email "MyString@example.com"
    password "MyString"
    password_confirmation "MyString"
  end
end
