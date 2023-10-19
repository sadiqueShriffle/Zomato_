# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return(user)
    controller.current_user
  end

  # describe 'GET #index' do
  #   let(:subject) { create(:user) }
  #   context 'successful responses' do
  #     # login_user

  #     def login_user
  #       # Before each test, create and login the user
  #       before(:each) do
  #         @request.env['devise.mapping'] = Devise.mappings[:user]
  #         sign_in FactoryBot.create(:user)
  #       end
  #     end

  #   end

  #     let(:valid_session) {{}}

  #     it 'returns all posts when user is authorized' do
  #       get '/user'
  #       get :index, params: { name: subject.name, email: subject.email,type: subject.type,password: subject.password }

  #       expect(response.status).to eq(200)
  #       expect(response.parsed_body).to eq([subject.as_json])
  #     end
  #   end

  #   context 'unsuccessful responses' do
  #     it 'redirects user when they are not logged in' do
  #       get '/user'
  #       get :create, params: { name: subject.name, email: subject.email,type: subject.type,password: subject.password}

  #       expect(response.status).to eq(302)
  #     end
  #   end
end

# describe "GET /index" do
#   it "renders the index template of user" do
#     get user_path
#   end
# end

# it 'creates a user' do
#   expect_any_instance_of(User).to receive(:create).
#     with({name: 'Sideshow Bob'}.with_indifferent_access)
#   post :create, user:
#     { email: 'test@gmail.com',type: 'Owner' ,name: 'Sideshow Bob' }
# end

# describe "POST /create  "do
# context "with valid parameters"do
#   let(:user) {FactoryBot.create(:user)}

#   before do
#     post '/users', params:
#               { user: {
#                 name: user.name,
#                 email: user.email,
#                 type: user.type,
#                 password: user.password,
#                 password_confirmation: user.password_confirmation
#               } }
#     end

#     it 'returns the name' do
#       expect('sid').to eq(user.name)
#     end

#     it 'returns the email' do
#       expect('example@gmail.com').to eq(user.email)
#     end

#     it 'returns a created password' do
#       expect('password123').to eq(user.password)
#     end

#     it 'returns a created password_confirmation' do
#       expect('password123').to eq(user.password_confirmation)
#     end

#     it 'returns a created status' do
#       expect(response).to have_http_status(:unprocessable_entity)
#     end

#   end
# end
