FactoryBot.define do
  factory :task do
    name { 'MyTask' }
    amount { [0, 2, 30, 4000, 40, 300, 23].sample }
  end
end
