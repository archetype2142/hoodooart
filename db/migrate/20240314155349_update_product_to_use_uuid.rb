class UpdateProductToUseUuid < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :products do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE products ADD PRIMARY KEY (id);"
  end
end
