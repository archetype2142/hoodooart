# frozen_string_literal: true

# This component is a badge for complaint. It displays complaint status (pending/accepted/rejected)
class BadgeComponent < ApplicationComponent
  attr_reader :status, :svg, :svg_position

  SVG_ICONS = {
    inspection: 'M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75zm.375 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zM3.75 12h.007v.008H3.75V12zm.375 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm-.375 5.25h.007v.008H3.75v-.008zm.375 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z' # rubocop:disable Layout/LineLength
  }.freeze

  COLOR_CLASSES = {
    blue: { background_color: 'bg-sky-100', text_color: 'text-royalblue' },
    red: { background_color: 'bg-red-500', text_color: 'text-white' },
    green: { background_color: 'bg-emerald-100', text_color: 'text-emerald-600' },
    amber: { background_color: 'bg-amber-600', text_color: 'text-white' }
  }.freeze

  BASE_CLASSES = 'font-sans inline-block py-1 px-4 rounded-md whitespace-nowrap text-xs \
  font-normal'

  def initialize(status: :blue, svg: nil, svg_position: :before)
    super

    @status = status
    @svg = svg
    @svg_position = svg_position
  end

  private

  def color_class
    COLOR_CLASSES[status]
  end

  def svg_icon_definition
    SVG_ICONS[svg]
  end

  def base_classes
    BASE_CLASSES
  end
end
