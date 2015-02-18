class RegistrationsController < Devise::RegistrationsController
  before_filter :check_token, only: [:new]

  def new
    super
  end

  def create
    super do
      Invitation.available.by_token(params[:user][:token]).utilize!
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def check_token
    no_token_message unless params[:token].present? && Invitation.available.by_token(params[:token]).present?
  end

  def no_token_message
    render text: t('error.no_token')
  end

  def user_params
    params.required(:user).permit(:phone)
  end
end