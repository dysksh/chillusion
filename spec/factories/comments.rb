FactoryBot.define do
  factory :comment do
    content "Test Content"
    association :work
    # association :user
    user { work.user }
  end
end
