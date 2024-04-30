# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:json_response) { JSON.parse(response.body) }

  describe 'GET /products' do
    before(:each) { get '/products' }

    it { expect(response).to have_http_status(:success) }
    it { expect(json_response).to have_key('products') }
    it { expect(json_response['products']).to be_empty }

    context 'when product is stored' do
      before { Product.create(name: 'Product', description: 'Description') }

      it { expect(response).to have_http_status(:success) }
      it { expect(json_response).to have_key('products') }
      it { expect(json_response['products']).not_to be_empty }
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post '/products'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      put '/products/1'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete '/products/1'
      expect(response).to have_http_status(:success)
    end
  end
end
