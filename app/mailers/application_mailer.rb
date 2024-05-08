class ApplicationMailer < ActionMailer::Base
  default from: 'amin@hoodooart.com'
  layout "mailer"

  def info(params)
    @params = params

    mail(to: 'sales@hoodooart.com', subject: 'New user inquiry!')
  end
end
