FactoryBot.define do
  factory :user do
    name {'Tester'}
    sequence(:email) { |n| "user#{n}@test.com" }
    password {"userpassword"}
    password_confirmation {"userpassword"}

    trait :with_items do
      after(:build) do |user|
        user.items << build(:item)
      end
    end
  end

  factory :hiroshi, class: User do
    email {"ueki@test.com"}
    password {"hiroshi123"}
    password_confirmation {"hiroshi123"}
  end
end
