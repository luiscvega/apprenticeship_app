class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to apprenticeships_url, :notice => "Signed In!"
    else
      redirect_to signin_url, :notice => "It seems your e-mail and/or password don't match. Wanna try again? You're almost there!"
    end
  end

  def destroy
    reset_session
    redirect_to signin_url, :notice => "You were signed out. Come back soon!"
  end
end
