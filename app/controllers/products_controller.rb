class ProductsController < ApplicationController
  before_action :set_category
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = @category.products.build
  end

  def create
    @product = @category.products.build(product_params)
    @product.author = current_user

    if @product.save
      flash[:notice] = 'Product has been created.'
      redirect_to [@category, @product]
    else
      flash.now[:alert] = 'Product has not been created.'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product has been updated.'
      redirect_to [@category, @product]
    else
      flash[:alert] = 'Product has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Product has been deleted.'

    redirect_to @category
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
