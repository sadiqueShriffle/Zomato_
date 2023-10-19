# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { 'sid' }
    email { 'example@gmail.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    image { nil }
    type { 'Owner' }
  end
end
