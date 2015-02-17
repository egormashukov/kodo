class InvitationMailer < ActionMailer::Base
  default from: '<admin@kodo.com>'

  def send_invitation(email)
    mail(to: emails, subject: 'Invitation to KodoLabs', body: 'ok')
  end
end