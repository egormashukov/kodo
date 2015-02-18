class Admin::InvitationsController < ApplicationController
  inherit_resources
  actions :new, :create

  def create
    create! { root_path }
  end

  private

  def permitted_params
    params.permit(invitation: [:email])
  end
end
