require 'rails_helper'

RSpec.describe "Restaurents", type: :request do
  
  describe "GET /index" do
      it "renders the index template of restaurent" do
      get '/restaurents'
    end
  end

  describe "GET /SHOW" do
      it "renders the show template of restaurent" do
      get '/restaurents/:id'
    end
  end
  
  describe "POST /create  "do 
    context "with valid parameters"do
      let(:restaurent) {FactoryBot.create(:restaurent)}
      
      before do
        post '/restaurents', params:
                  { restaurent: {
                    name: restaurent.name,
                    status: restaurent.status,
                    place: restaurent.place,
                  } }
        end

        it 'returns the name' do
          expect("indori Zayka").to eq(restaurent.name)
        end
  
        it 'returns the place' do
          expect("indore").to eq(restaurent.place)
        end
  
        it 'returns a status' do
          expect("open").to eq(restaurent.status)
        end

        it 'returns a created status' do
          expect(response).to have_http_status(:found)
        end

      end
    end


end
