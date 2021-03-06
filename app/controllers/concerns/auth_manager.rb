module AuthManager
  extend ActiveSupport::Concern

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out(user)
    session[:user_id] = nil
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id].present?
  end

  def signed_in?
    current_user.present?
  end
end
