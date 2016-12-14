FactoryGirl.define do
  factory :user, aliases: [:host] do
    first_name "MyString"
    last_name "MyString"
    sequence :email do |n|
     "MyString#{n}@example.com"
    end
    password "MyString"
    password_confirmation "MyString"
  end
end
