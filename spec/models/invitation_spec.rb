require 'rails_helper'

describe Invitation do

  subject { FactoryGirl.create(:invitation_available) }

  describe '#utilize!' do
    before{ subject.utilize! }
    its(:available) { should be_falsey }
  end
end
