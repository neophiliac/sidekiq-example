# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    email "MyString"
    description "MyString"
    sent_at "2014-01-20 14:54:16"
  end
end
