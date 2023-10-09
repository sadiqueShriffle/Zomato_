require 'faker'

FactoryBot.define do
factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    image { nil }
    type { 'customer' } # Adjust based on your user types

  end
end
