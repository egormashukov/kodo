class Invitation < ActiveRecord::Base
  scope :available, -> { where(available: true) }
  scope :by_token, ->(token) { where(token: token) }

  before_create :assign_token
  after_create :send_invitation

  def self.utilize!
    update_all(available: false)
  end

  private

  def assign_token
    self.token = token_function
  end

  def token_function
    SecureRandom.urlsafe_base64
  end

  def send_invitation
    InvitationMailer.send_invitation(self.email, self.token).deliver
  end
end
