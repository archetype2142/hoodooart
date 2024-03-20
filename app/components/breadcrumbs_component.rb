# frozen_string_literal: true

class BreadcrumbsComponent < ApplicationComponent
  attr_reader :crumbs

  def initialize(crumbs:)
    super
    @crumbs = crumbs
  end
end
