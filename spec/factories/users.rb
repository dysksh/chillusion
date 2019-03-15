FactoryBot.define do
  factory :user do
      sequence(:name) { |n| "test#{n}" }
      sequence(:email) { |n| "test#{n}@example.com" }
      password "test1234"
  end
end
