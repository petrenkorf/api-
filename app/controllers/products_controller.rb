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
    if @product = Product.find_by_id(params[:id])
      @product.discard
      render json: { product: @product }, status: :ok
    else
      render json: {}, status: :not_found
    end
  end

  private

  def product_error
    render json: {errors: @product.errors }, status: :unprocessable_entity
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
