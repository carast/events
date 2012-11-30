class SessionsController < ApplicationController
  def new
  end

  def create
    identity = Identity.authenticate params[:email], params[:password]

    if identity
      session[:identity_id] = identity.id
      return redirect_to root_url, notice: t('.logged_in')
    end
    flash.now.alert = t('.invalid_credentials')
    render :new
  end

  def destroy
    session[:identity_id] = nil
    redirect_to root_url, notice: t('.logged_out')
  end
end

