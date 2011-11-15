class ApprenticeshipsController < ApplicationController
  can_edit_on_the_spot
  
  before_filter :require_user
  
  def index
    @apprenticeships = current_user.apprenticeships
  end
  
  def show
    @apprenticeship = current_apprenticeship
    @messages = current_apprenticeship.messages.order(:created_at).page(params[:page]).per(13)
    @resources = current_apprenticeship.resources.all
    @message = Message.new
    @corkboard = @apprenticeship.corkboard

    if current_user == @apprenticeship.student
      @student = current_user
      @mentor = @apprenticeship.mentor
    else
      @student = @apprenticeship.student
      @mentor = current_user
    end
  end
  
  def new
    @available_mentors = User.where(:mentor => true) # ADD USERS WHOSE MENTOR MODE IS ON
    @available_mentors = @available_mentors.where(["id <> ?", current_user.id]) # REMOVE CURRENT USER
    @available_mentors = @available_mentors.where(["id NOT IN (?)", current_user.apprenticeships.map {|u| u.student.id }]) if current_user.apprenticeships.any?
    @available_mentors = @available_mentors.where(["id NOT IN (?)", current_user.apprenticeships.map {|u| u.mentor.id }]) if current_user.apprenticeships.any?
  
    @available_mentors = @available_mentors.order("first_name ASC").page(params[:page]).per(10)
    
  end
  
  def create
    @apprenticeship = Apprenticeship.new
    @apprenticeship.student = current_user
    @apprenticeship.mentor = User.find(params[:id])

    if @apprenticeship.save
      redirect_to apprenticeship_url(@apprenticeship), :notice => "Apprenticeship created!"
    else
      redirect_to new_apprenticeship_url, :notice => "Apprenticeship not established.."
    end
    @apprenticeship.build_corkboard(notes: "This is your Corkboard! Click here to edit the text inside and create useful notes for your apprenticeship!").save
  end
end
