require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  subject{
    FactoryBot.create(:order_item)
  }

  it "should"

  it {should belong_to(:order)}
  it {should belong_to(:dish)}




end
