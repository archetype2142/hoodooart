# frozen_string_literal: true

class ProductCardComponent < ViewComponent::Base
  def initialize(product:, current_user:)
    @product = product
    @current_user = current_user
  end
end
