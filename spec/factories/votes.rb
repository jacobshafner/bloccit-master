FactoryGirl.define do
  factory :vote do
    value 1
    user
    topic
    post
  end
end
