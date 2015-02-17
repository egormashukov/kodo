class Invitation < ActiveRecord::Base

  scope :available, -> { where(available: true) }

  def utilize
    self.update_attribute(:available, false)
  end
end
