class ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: { products: @products }
  end

  def create
    @product = Product.create(product_params)

    return product_error if @product.invalid?

    render json: { product: @product }, status: :ok
  end

  def update
  end

  def destroy
  end

  private

  def product_error
    render json: {errors: @product.errors }, status: :unprocessable_entity
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
