class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new
    unless Whitelist.exists?(:email => params[:user][:email])
      @user.errors.add :email, "#{params[:user][:email]} is not allowed to register."
      render action: "new"
    else
      super  
    end
  end
end
