class UsersController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id

      flash[:notice] = "Wow! We're glad you're here! This is the Apprenticeships Page. Here you can check current apprenticeships and add new ones. Remember, you can ONLY ADD MENTORS, you must seek out your guide, which I think is a truly humbling gesture. But you can be a mentor to someone else as well. If you don't want students to add you as their mentor, turn off your Mentor Mode. I'm glad to have built this. I've learned a lot doing so. Finally, enjoy! - Luis"
      
      UserMailer.send_confirmation(@user).deliver
      
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
  
  def toggle
    current_user.toggle
    respond_to do |format|
      format.html { redirect_to :back }
      format.js   
    end
      
  end
  
end
