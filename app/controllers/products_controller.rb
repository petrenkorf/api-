class ProductsController < ApplicationController
  def index
    render json: { products: Product.all }
  end

  def create
  end

  def update
  end

  def destroy
  end
end
