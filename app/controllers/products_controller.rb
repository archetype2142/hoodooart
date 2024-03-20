class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @q = Product.ransack(params[:q])

    @q.sorts = 'id desc' if @q.sorts.empty?
    per_page = params[:per] || session[:items_per_page] || 20
    session[:items_per_page] = per_page
    @pagy, @products = pagy(@q.result, items: per_page)
  end

  def show; end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
