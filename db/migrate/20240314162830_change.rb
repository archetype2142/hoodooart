class Change < ActiveRecord::Migration[7.1]
  def change
    remove_column :active_storage_attachments, :record_id
    add_column :active_storage_attachments, :record_id, :uuid
  end
end
