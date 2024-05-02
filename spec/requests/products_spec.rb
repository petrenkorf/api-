# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:json_response) { JSON.parse(response.body) }

  describe 'GET /products' do
    context 'when there are no products' do
      before(:each) { get '/products' }

      it { expect(response).to have_http_status(:success) }
      it { expect(json_response).to have_key('products') }
      it { expect(json_response['products']).to be_empty }
    end

    context 'when product is stored' do
      before(:each) do
        create :product
        get '/products'
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(json_response).to have_key('products') }
      it { expect(json_response['products']).not_to be_empty }
      it { expect(json_response['products'].first['name']).to eq 'Product' }
      it { expect(json_response['products'].first['description']).to eq 'Product description' }
    end
  end

  describe 'POST /create' do
    before(:each) { post '/products', params: }
    let(:name) { 'Product' }
    let(:description) { 'Product description' }
    let(:params) do
      {
        product: {
          name:,
          description:
        }
      }
    end

    context 'with valid input' do
      it { expect(response).to have_http_status(:success) }
      it { expect(json_response['product']['name']).to eq 'Product' }
      it { expect(json_response['product']['description']).to eq 'Product description' }
    end

    context 'with invalid input' do
      let(:name) { 'Product' * 1000 }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(json_response['errors']['name'].first).to eq 'is too long (maximum is 100 characters)' }
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      put '/products/1'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    context 'when product exists' do
      let(:existent_product) { create(:product) }
      before(:each) { delete "/products/#{existent_product.id}" }

      it { expect(response).to have_http_status(:success) }
      it { expect(existent_product.reload).to be_discarded }
    end

    context 'when product does not exists' do
      before(:each) { delete '/products/1542' }

      it { expect(response).to have_http_status(:not_found) }
    end
  end
end
