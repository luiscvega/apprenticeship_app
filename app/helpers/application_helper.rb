module ApplicationHelper
  
  def user_types
    if current_user == @apprenticeship.student
      @student = current_user
      @mentor = @apprenticeship.mentor
    else
      @student = @apprenticeship.student
      @mentor = current_user
    end
  end

  def current_mentor?
    current_apprenticeship.mentor == current_user 
  end

  def current_student?
    current_apprenticeship.student == current_user
  end


end
