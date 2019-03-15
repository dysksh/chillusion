FactoryBot.define do
  factory :work do
    title "Test Work"
    association :user

    trait :with_comments do
      after(:create) { |work| create_list(:comment, 5, work: work) }
    end
  end
end
