class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer :price, default: 0
      t.boolean :hide, default: false

      t.timestamps
    end
  end
end
