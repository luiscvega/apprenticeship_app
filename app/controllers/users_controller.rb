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
  
  @tutorial = ""
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id

      flash[:notice] = "Wow! We're glad you're here!"
      flash[:notice1] = "This is the Apprenticeships Page. Here you can check current apprenticeships and add new ones."
      flash[:notice2] = "Remember, you can ONLY ADD MENTORS, you must seek out your guide. But you can be a mentor to someone else."
      flash[:notice3] = "If you don't want students to add you as their mentor, turn off your Mentor Mode"
      flash[:notice4] = "Finally, enjoy! - Luis"

      redirect_to apprenticeships_url
      
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
