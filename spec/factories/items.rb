FactoryBot.define do
  factory :item do
    title "one"
    body "one body"
    association :user
  end
end
