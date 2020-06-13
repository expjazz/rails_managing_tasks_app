require 'faker'
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::FunnyName.name }
    password { 'foobar' }
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    profile { Employee.create(function: 'CEO') }
  end
end
