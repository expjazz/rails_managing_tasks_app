require 'faker'
FactoryBot.define do
  factory :user do
    name { Faker::Name.name[1..15] }
    password { 'foobar' }
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
  end
end
