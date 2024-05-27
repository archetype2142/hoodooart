class CreateUserProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :user_products do |t|
      t.references :user, type: :uuid
      t.references :product, type: :uuid

      t.integer :price_cents, default: 0
    end
  end
end
