class ApprenticeshipsController < ApplicationController
  can_edit_on_the_spot
  
  before_filter :require_user
  
  def index
    @apprenticeships = current_user.apprenticeships
  end
  
  def show
    @messages = current_apprenticeship.messages.order(:created_at).page(params[:page]).per(13)
    destroy_notifications(@messages) #Delete notifications once they've been read.
    @message = Message.new  
  end
  
  def new
    @available_mentors = User.scoped.available_mentors(current_user).order("first_name ASC").page(params[:page]).per(10) #Scope list of users to only available mentors. See user.rb for scope.
  end
  
  def create
    @apprenticeship = Apprenticeship.new(student: current_user, mentor: User.find(params[:id]))

    if @apprenticeship.save
      redirect_to apprenticeship_url(@apprenticeship), :notice => "Apprenticeship created!"
    else
      redirect_to new_apprenticeship_url, :notice => "Apprenticeship not established.."
    end
  end
end
