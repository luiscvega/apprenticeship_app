class ApprenticeshipsController < ApplicationController
  def index
    @apprenticeships = current_user.apprenticeships
  end
  
  def show
    @apprenticeship = current_apprenticeship
    @messages = current_apprenticeship.messages.all

    if current_user == @apprenticeship.student
      @student = current_user
      @mentor = @apprenticeship.mentor
    else
      @student = @apprenticeship.student
      @mentor = current_user
    end
  end
  
  def new
    @available_students
    @available_mentors
  end
end
