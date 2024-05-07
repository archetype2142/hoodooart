# frozen_string_literal: true

# This is button component. There is primary button type and outlined with different css classes.
class ButtonComponent < ApplicationComponent
  attr_accessor :type, :options, :data_options, :button_type

  PRIMARY_CLASSES = %w[
    bg-royalblue text-white font-semibold hover:bg-indigo-900
  ].freeze

  OUTLINE_CLASSES = %w[
    hover:bg-royalblue hover:text-white border text-royalblue border-royalblue font-semibold
  ].freeze

  BASE_CLASSES = %w[
    inline-block mt-1 px-4 py-2 rounded
  ].freeze

  BUTTON_TYPE_MAPPINGS = {
    primary: PRIMARY_CLASSES,
    outline: OUTLINE_CLASSES
  }.freeze

  def initialize(type: :primary, button_type: 'button', **options)
    super

    @type = type
    @options = options
    @button_type = button_type
    @data_options = options.delete(:data) || {}
  end

  def classes
    "#{(BUTTON_TYPE_MAPPINGS[type] + BASE_CLASSES).join(' ')} #{custom_classes}"
  end

  def custom_classes
    options[:custom_classes]
  end
end
