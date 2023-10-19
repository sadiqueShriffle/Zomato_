# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :restaurent do
    name { 'indori Zayka' }
    place { 'indore' }
    # traits_for_enum :status, %w[open close]
    status { 'open' }
    user
  end
end
