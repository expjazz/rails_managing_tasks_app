FactoryBot.define do
  factory :group do
    name { Faker::Marketing.buzzwords }
    user { User.first }
  end
end
