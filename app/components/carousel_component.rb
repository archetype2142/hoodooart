# frozen_string_literal: true

class CarouselComponent < ApplicationComponent
  def initialize(images = nil)
    super

    @images = images
  end
end
