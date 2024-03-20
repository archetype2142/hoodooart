class Category < ApplicationRecord
	extend Mobility

  has_many :product_categories
  has_many :products, through: :product_categories

	translates :title, type: :string, fallbacks: { pl: :en, en: :pl }
	validates :title, presence: true

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["id", "id_value", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["product_categories", "products", "string_translations"]
  end
end
