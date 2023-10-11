require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    it "renders the index template of cateogry" do
      get '/restaurents/:restaurent_id/categories'
  end
end

describe "GET /Show " do
  it "renders the show template of category" do
    get '/categories/:id'
  end
end

describe "POST /create  "do 
context "with valid parameters"do
  let(:category) {FactoryBot.create(:category)}
  
  before do
    post '/restaurents/:restaurent_id/categories', params:
              { category: {
                name: category.name
              } }
    end

    it 'returns the name' do
      expect("Chinese").to eq(category.name)
    end


    it 'returns a created status' do
      expect(response).to have_http_status(:found)
    end

  end
end


end
