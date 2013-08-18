class SessionsController < ApplicationController
  
  def new
  end

  def create
    if params[:email]
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      else
        flash[:notice] = "Invalid Email or Password"
        redirect_to request.referer
      end
    else
      user = User.from_omniauth(env["omniauth.auth"])
      if user.valid?
        session[:user_id] = user.id
        redirect_to root_url, notice: "Signed in!"
      else
        flash[:notice] = "email already exists"
        redirect_to root_url
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
