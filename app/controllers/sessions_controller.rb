class SessionsController < ApplicationController
  def new
  end

  def create
    identity = Identity.authenticate params[:email], params[:password]

    if identity
      self.current_identity = identity.id
      return redirect_to root_url, notice: t('.logged_in')
    end
    flash.now.alert = t('.invalid_credentials')
    render :new
  end

  def destroy
    self.current_identity = nil
    redirect_to root_url, notice: t('.logged_out')
  end
end

