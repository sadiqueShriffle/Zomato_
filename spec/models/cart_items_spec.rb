require 'rails_helper'

RSpec.describe CartItem, type: :model do
  subject{
    FactoryBot.create(:cart_item)
    }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

    it {should belong_to(:cart)}
    it {should belong_to(:dish)}



end
