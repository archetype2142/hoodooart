class ChangeTranslatableIdToUuid < ActiveRecord::Migration[7.1]
  def change
    remove_column :mobility_text_translations, :translatable_id
    remove_column :mobility_string_translations, :translatable_id

    add_column :mobility_text_translations, :translatable_id, :uuid
    add_column :mobility_string_translations, :translatable_id, :uuid
  end
end
