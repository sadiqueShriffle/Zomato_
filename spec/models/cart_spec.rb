# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject do
    FactoryBot.create(:cart)
  end

  it { should belong_to(:user) }
end
