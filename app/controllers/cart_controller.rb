class CartController < ApplicationController
  before_action :product, only: %i[modify_product]

  def show; end

  def destroy_product
  	cookies.delete(params[:product_id].to_sym)
  	cookies[:products] = cookies[:products].gsub(params[:product_id], '')
  	cookies[:cart] = cookies[:cart].to_i - 1

  	redirect_to cart_path, status: :see_other
  end

  def modify_product
  	cookies[:cart] = cookies[params[:product_id].to_sym].present? ? cookies[:cart] : cookies[:cart].to_i + 1
  	cookies[params[:product_id].to_sym] = params[:quantity]

  	cookies[:products] = '' if cookies[:products].nil?
		cookies[:products] = (cookies[:products] + "#{params[:product_id]},") unless cookies[:products].split(',').include?(params[:product_id])

  	if params[:quantity].to_i <= 0
  		(cookies[:cart] = cookies[:cart].to_i - 1) if cookies[params[:product_id].to_sym]
  		cookies.delete(params[:product_id].to_sym)
  		cookies[:products] = cookies[:products].gsub(params[:product_id], '')
  	end

  	redirect_to product_path(@product), flash: { message: I18n.t('updated_cart') }
  end

  private

  def product
  	@product ||= Product.find(params[:product_id])
  end
end
