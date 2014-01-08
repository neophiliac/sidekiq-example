# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_stat do
    url "example.com"
    page "<html><body></body></html>"
  end
end
