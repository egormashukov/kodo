class InvitationMailer < ActionMailer::Base
  default from: 'photoreal3d.kubrik@yandex.ru'

  def send_invitation(email, token)
    mail(to: email, subject: 'Invitation to KodoLabs', body: new_user_registration_url(token: token))
  end
end
