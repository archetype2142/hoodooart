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
      :phone,
      :nip,
      :message,
      :consent_1,
      :consent_2
    )
  end
end
