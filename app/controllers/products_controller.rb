class ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: { products: @products }
  end

  def create
  end

  def update
  end

  def destroy
  end
end
