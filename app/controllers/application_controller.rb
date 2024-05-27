::OpenSSL::SSL::VERIFY_PEER = ::OpenSSL::SSL::VERIFY_NONE

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ActiveStorage::SetCurrent
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    locale = choose_locale
    locale = :en unless locale&.to_sym&.in?(I18n.available_locales)

    I18n.locale = locale

    cookies[:lang] = locale if locale != cookies[:lang]
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def choose_locale
    i18n_from_param = params[:locale]&.to_sym
    return i18n_from_param if i18n_from_param.in?(I18n.available_locales)

    i18n_from_cookie = cookies[:lang]&.to_sym
    return i18n_from_cookie if i18n_from_cookie.in?(I18n.available_locales)
  rescue NameError
    :en
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
  end
end
