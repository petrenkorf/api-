# frozen_string_literal: true

Given('There is a product stored') do
  Product.create!(name: 'product', description: 'description')
end

Given('There are no products stored') do
  Product.delete_all
end

When('I delete the product') do
  Product.last.discard!
end

When('I send data to product endpoint') do
  post '/products', { product: { name: 'product', description: 'description' } }
end

When(/^I visit (.*)$/) do |uri|
  get uri
end

Then('I should have a successful response') do
  expect(last_response.status).to eq(200)
end

Then('I should receive a json response') do
  expect { JSON.parse last_response.body }.to_not raise_error
end

Then(/^JSON response should have the key (.*)$/) do |key|
  json_response = JSON.parse(last_response.body)

  expect(json_response).to have_key key
end

Then('Product data should be in response') do
  product = JSON.parse(last_response.body)['product']

  expect(product['name']).to eq 'product'
  expect(product['description']).to eq 'description'
end

Then(/^(.*) key should be empty$/) do |key|
  field = JSON.parse(last_response.body)[key]

  expect(field).to be_empty
end
