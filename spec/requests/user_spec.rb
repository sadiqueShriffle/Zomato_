require 'rails_helper'

RSpec.describe "Users", type: :request do

    describe "GET /index" do
      it "renders the index template of user" do
        get user_path
      end
    end


    # it 'creates a user' do
    #   expect_any_instance_of(User).to receive(:create).
    #     with({name: 'Sideshow Bob'}.with_indifferent_access)
    #   post :create, user: 
    #     { email: 'test@gmail.com',type: 'Owner' ,name: 'Sideshow Bob' }
    # end


    describe "POST /create  "do 
    context "with valid parameters"do
      let(:user) {FactoryBot.create(:user)}
      
      before do
        post '/users', params:
                  { user: {
                    name: user.name,
                    email: user.email,
                    type: user.type,
                    password: user.password,
                    password_confirmation: user.password_confirmation
                  } }
        end

        it 'returns the name' do
          expect('sid').to eq(user.name)
        end
  
        it 'returns the email' do
          expect('example@gmail.com').to eq(user.email)
        end
  
        it 'returns a created password' do
          expect('password123').to eq(user.password)
        end

        it 'returns a created password_confirmation' do
          expect('password123').to eq(user.password_confirmation)
        end

        it 'returns a created status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

      end
    end


end
