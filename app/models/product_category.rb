class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "id", "id_value", "product_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "product"]
  end
end
