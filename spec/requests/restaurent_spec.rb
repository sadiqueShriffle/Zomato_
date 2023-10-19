# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Restaurents', type: :request do
  let(:user) { FactoryBot.create(:user) }
  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return(user)
    controller.current_user
  end

  let(:restaurent) { FactoryBot.create(:restaurent) }

  describe 'GET #new' do
    before do
      get '/restaurents/new'
    end
    it 'is expected to assign user as new instance variable' do
      expect(assigns[:restaurent]).to be_instance_of(Restaurent)
    end
    it 'renders new template' do
      expect(response).to render_template(:new)
    end
  end

  # create action
  describe 'POST #create' do
    context 'when params are correct' do
      it 'is expected to create new Restaurent successfully' do
        post '/restaurents/new', params: { restaurent: {
          name: restaurent.name,
          status: restaurent.status,
          place: restaurent.place
        } }
        expect(response).to have_http_status(201)
        # expect(JSON.parse(response.body)['data']['id']).to eq(skills.last.id.to_s)
      end
    end
    context 'when params are not correct' do
      it 'is expected to render new template' do
        post '/restaurents/new', params: invalid_params
        is_expected.to render_template(:new)
        expect(response).to have_http_status(422)
      end
    end
  end

  # describe "GET /index" do
  #     it "renders the index template of restaurent" do
  #     get '/restaurents'
  #   end
  # end

  # describe "GET /SHOW" do
  #     it "renders the show template of restaurent" do
  #     get '/restaurents/:id'
  #   end
  # end

  # describe "POST /create  "do
  #   context "with valid parameters"do
  #     let(:restaurent) {FactoryBot.create(:restaurent)}

  #     before do
  #       post '/restaurents', params:
  #                 { restaurent: {
  #                   name: restaurent.name,
  #                   status: restaurent.status,
  #                   place: restaurent.place,
  #                 } }
  #       end

  #       it 'returns the name' do
  #         expect("indori Zayka").to eq(restaurent.name)
  #       end

  #       it 'returns the place' do
  #         expect("indore").to eq(restaurent.place)
  #       end

  #       it 'returns a status' do
  #         expect("open").to eq(restaurent.status)
  #       end

  #       it 'returns a created status' do
  #         expect(response).to have_http_status(:found)
  #       end

  #     end
  #   end
end
