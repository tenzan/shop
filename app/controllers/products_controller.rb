class ProductsController < ApplicationController
  before_action :set_category
  before_action :set_product, only: [:show]

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_product
    @product = @category.products.find(params[:id])
  end

end
