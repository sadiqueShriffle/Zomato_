require 'rails_helper'

RSpec.describe "Users", type: :request do

    describe "GET /index" do
      it "renders the index template of user" do
        get user_path
      end
    end

    describe "POST /create  "do 
    context "with valid parameters"do
      let!(:my_user) {FactoryBot.create(:user)}
      
      before do
        post '/user/new', params:
                  { user: {
                    name: my_user.name,
                    email: my_user.email,
                    password: my_user.password,
                    password_confirmation: my_user.password_confirmation
                  } }
        end

        it 'returns the name' do
          expect(json['title']).to eq(my_post.title)
        end
  
        it 'returns the email' do
          expect(json['content']).to eq(my_post.content)
        end
  
        it 'returns a created password' do
          expect(json).to have_http_status(:created)
        end

        it 'returns a created password_confirmation' do
          expect(json).to have_http_status(:created)
        end

        it 'returns a created status' do
          expect(response).to have_http_status(:created)
        end

      end
    end


end
