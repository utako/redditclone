# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    parent_comment_id "MyString"
    link_id "MyString"
    body "MyString"
  end
end
