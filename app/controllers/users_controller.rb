class UsersController < ApplicationController
  def toggle
    current_user.toggle
    redirect_to :back, notice: "Mentor Mode Changed!"
  end
  
  def show
  end
end
