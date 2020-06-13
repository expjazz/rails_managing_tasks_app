FactoryBot.define do
  factory :project do
    name { Faker::FunnyName.name }
    user { FactoryBot.create(:user) }
  end
end
