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

When(/^I update existent product$/) do
  product = Product.last
  put "/products/#{product.id}", { product: { name: 'updated product', description: 'updated description' } }
end

When(/^I update existent product with$/) do |table|
  product = Product.last
  table.hashes.each do |input|
    put "/products/#{product.id}", { product: input.compact }
  end
end

Then('I should have a successful response') do
  expect(last_response.status).to eq(200)
end

Then(/^I should have a response with (.*) status code$/) do |status_code|
  expect(last_response.status).to eq(status_code.to_i)
end

Then('I should receive a json response') do
  expect { JSON.parse last_response.body }.to_not raise_error
end

Then(/^JSON response should have the key (.*)$/) do |key|
  json_response = JSON.parse(last_response.body)

  expect(json_response).to have_key key
end

Then(/^Product attribute (.*) should be (.*)$/) do |attr, val|
  product = JSON.parse(last_response.body)['product']

  expect(product[attr]).to eq val
end

Then(/^(.*) key should be empty$/) do |key|
  field = JSON.parse(last_response.body)[key]

  expect(field).to be_empty
end

Then(/^(.*) key should not be empty$/) do |key|
  field = JSON.parse(last_response.body)[key]

  expect(field).not_to be_empty
end
