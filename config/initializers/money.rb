# frozen_string_literal: true

MoneyRails.configure do |config|
  config.default_currency = :pln
end

Money.locale_backend = :i18n
Money.rounding_mode = BigDecimal::ROUND_HALF_UP
