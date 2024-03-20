class CreateProductCategory < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories, id: :uuid do |t|
      t.references :product, type: :uuid
      t.references :category, type: :uuid
    end
  end
end
