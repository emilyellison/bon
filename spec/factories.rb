FactoryGirl.define do
  factory :user do
    name                  "Emily Ellison"
    email                 "emilyellison986@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end