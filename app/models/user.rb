class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable, :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :validatable


  def send_invitation
    begin
      InvitationMailer.send_invitation(params[:emails], current_contractor).deliver
      notice = I18n.t('notice.contacts.send_invitations')
    rescue
      notice = I18n.t('notice.contacts.impossible')
    end
  end
end
