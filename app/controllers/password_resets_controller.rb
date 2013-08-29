class PasswordResetsController < ApplicationController
  def new
  end

  def create
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end
end
