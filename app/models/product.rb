class Product < ApplicationRecord
  extend Mobility

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many_attached :images do |attachable|
    attachable.variant(:thumb, resize_to_limit: [520, 520])
  end
  translates  :title, :description, backend: :action_text

  validates :title, presence: true

  monetize :price_cents


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "hide", "id", "id_value", "price_cents", "title", "updated_at", "sku"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "images_attachments", "images_blobs", "product_categories", "string_translations"]
  end
end
