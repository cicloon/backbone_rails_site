class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_title

  private

  def set_title
    @title = "Nuestra Boda"
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.email.blank?
      new_users_email_path
    else
      super
    end
  end

  def require_login
    redirect_to new_user_session_path unless user_signed_in?
  end

end
