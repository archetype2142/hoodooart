class ContactController < ApplicationController
  def create
    ApplicationMailer.info(permitted_params).deliver_later

    redirect_to contact_path, flash: { message: I18n.t('sent_mail') }
  end

  private

  def permitted_params
    params.permit(
      :first_name,
      :last_name,
      :phone_number,
      :phone,
      :email,
      :nip,
      :custom_message,
      :message,
      :company_name,
      :consent_1,
      :consent_2,
      products: [:sku, :price, :quantity, :name]
    )
  end
end
