class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_identity, :identity_logged?

private
  def current_identity
    @current_identity ||= Identity.find(session[:identity_id]) if session[:identity_id]
  end

  def current_identity=(identity_id)
    session[:identity_id] = identity_id
  end

  def identity_logged?
    !current_identity.nil?
  end
end
