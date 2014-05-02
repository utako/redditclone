# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_sub do

    link_id { create(:link).id }
    sub_id { create(:sub).id }
  end
end
