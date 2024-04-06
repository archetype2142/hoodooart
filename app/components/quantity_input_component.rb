# frozen_string_literal: true

class QuantityInputComponent < ViewComponent::Base
  def initialize(quantity:)
    @quantity = quantity
  end
end
