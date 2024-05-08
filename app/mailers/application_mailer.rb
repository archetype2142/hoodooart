class ApplicationMailer < ActionMailer::Base
  default from: 'sales@hoodooart.com'
  layout "mailer"

  def info(params)
    @params = params

    mail(to: 'sales@hoodooart.com', subject: 'New user inquiry!')
  end
end
