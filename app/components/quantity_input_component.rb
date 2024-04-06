# frozen_string_literal: true

class QuantityInputComponent < ViewComponent::Base
  def initialize(quantity:, name:)
    @quantity = quantity
    @name = name
  end
end
