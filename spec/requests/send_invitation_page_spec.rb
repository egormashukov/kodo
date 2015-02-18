require 'rails_helper'

describe 'Send invitation page' do

  before { visit root_path }
  let(:some_email) { Faker::Internet.email }

  specify 'should send invitation to filled email' do

    within '#new_invitation' do
      fill_in 'invitation_email', with: some_email
      click_on 'Send Invitation'
    end

    within '.alert-success' do
      page.should have_content 'Invitation was successfully created.'
      Invitation.last.email.should eq(some_email)
    end
  end
end
