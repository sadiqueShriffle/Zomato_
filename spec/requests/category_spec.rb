# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    it 'renders the index template of cateogry' do
      get '/restaurents/:restaurent_id/categories'
    end

    it 'returns all category' do
      expect { JSON.parse(response.body).to eq(10) }
    end

    # it 'returns status code 200' do
    #   expect(response).to have_http_status(302)
    #   end
  end

  describe 'GET /Show ' do
    it 'renders the show template of category' do
      get '/categories/:id'
    end
  end

  describe 'POST /create  ' do
    let!(:category) { FactoryBot.create(:category) }
    context 'with valid parameters' do
      before do
        post '/restaurents/:restaurent_id/categories', params:
                  { category: {
                    name: category.name
                  } }
      end

      it 'returns the name' do
        expect('Chinese').to eq(category.name)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/restaurents/:restaurent_id/categories', params:
                          { category: {
                            name: nil
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:found)
      end
    end
  end
end
