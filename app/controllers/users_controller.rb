class UsersController < ApplicationController
  def toggle
    current_user.toggle
    redirect_to :back
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to apprenticeships_url, notice: "Wow! We're glad you're here!"
    else
      redirect_to signup_url, notice: "There seems to have been a problem. Can you try again? Thanks!"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to apprenticeships_url, notice: "Great! Your settings have been changed"
    else
      redirect_to signup_url, notice: "There seems to have been a problem. Can you try again? Thanks!"
    end
  end
end
