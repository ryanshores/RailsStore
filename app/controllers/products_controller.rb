class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  before_action :load_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render_unprocessable(:new)
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render_unprocessable(:edit)
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def load_product
      @product = Product.find(params[:id])
    end

    def render_unprocessable(template)
      render template, status: :unprocessable_entity
    end

    def product_params
      params.require(:product).permit(:name)
    end
end
