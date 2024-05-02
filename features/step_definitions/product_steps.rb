# frozen_string_literal: true

When('I send data to product endpoint') do
  post '/products', { product: { name: 'product', description: 'description' } }
end

Then('I should have a successful response') do
  expect(last_response.status).to eq(200)
end

Then('I should receive a json response') do
  expect { JSON.parse last_response.body }.to_not raise_error
end

Then('Product data should be in response') do
  product = JSON.parse(last_response.body)['product']

  expect(product['name']).to eq 'product'
  expect(product['description']).to eq 'description'
end
