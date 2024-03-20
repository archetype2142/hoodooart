class ChangeMobilityStringTranslationToUuid < ActiveRecord::Migration[7.1]
  def change
    change_column :mobility_string_translations, :translatable_id, :string
    change_column :mobility_text_translations, :translatable_id, :string
  end
end
