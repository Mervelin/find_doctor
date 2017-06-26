require 'faker'

FactoryGirl .define do
  factory :doctor do
    first_name 'John'
    last_name 'Walker'
    password 'password'
    sequence(:email) { |n| "tester#{n}@tester.com"}
  end
end