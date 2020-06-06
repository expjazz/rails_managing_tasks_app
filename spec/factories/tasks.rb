FactoryBot.define do
  factory :task do
    name { 'MyString' }
    amount { 100 }
    user { nil }
  end
end
