class IdentitiesController < ApplicationController

  def new
    @identity = Identity.new
  end

  def create
    @identity = Identity.new identity_params

    if @identity.save
      self.current_identity = @identity.id
      redirect_to root_url, notice: t('.sign_up')
    else
      render :new
    end
  end

private
  def identity_params
    params.require(:identity).permit :email, :password, :password_confirmation
  end

end
