class AdminController < ApplicationController

  def login
    if request.post?

      if params[:username] == "admin" && params[:password] == "admin123"

        session[:admin_logged_in] = true

        redirect_to root_path

      else

        flash.now[:alert] = "Invalid Username or Password"

      end

    end
  end


  def logout

    session[:admin_logged_in] = nil

    redirect_to admin_login_path

  end

end