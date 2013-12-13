class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource
    unless Whitelist.exists?(:email => params[:user][:email])
      resource.errors.add :email, "is not on our beta list"
    else
      super  
    end
  end
end
