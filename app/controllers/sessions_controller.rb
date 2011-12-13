class SessionsController < ApplicationController

  before_filter       :default_page, :only => :new
  skip_before_filter  :require_user
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to current_user, notice: "Signed In!"
    else
      redirect_to signin_url, :notice => "It seems your e-mail and/or password don't match. Wanna try again? You're almost there!"
    end
  end

  def destroy
    reset_session
    redirect_to signin_url, :notice => "You were signed out. Come back soon!"
  end
  
  private
  
  def default_page
    redirect_to apprenticeships_url if logged_in?
  end

end
