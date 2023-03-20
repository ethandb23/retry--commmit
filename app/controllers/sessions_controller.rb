class SessionsController < Devise::SessionsController
    def destroy
      super
      flash[:notice] = "You have successfully signed out."
    end
  end
  