class RenamePriceToPriceCents < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :price, :price_cents
  end
end
