# frozen_string_literal: true

class ImageGalleryComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end
end
