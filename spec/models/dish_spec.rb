require 'rails_helper'

RSpec.describe Dish, type: :model do

  subject{
    FactoryBot.create(:dish)
         }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a dish_type" do
      subject.dish_type = nil
      expect(subject).to_not be_valid
    end

    # Association Validation
  describe 'associations' do
    it {should belong_to(:category)}
  end

end
