class ApprenticeshipsController < ApplicationController
  can_edit_on_the_spot
  
  before_filter :require_user
  
  def index
    @apprenticeships = current_user.apprenticeships
  end
  
  def show
    @messages = current_apprenticeship.messages.order(:created_at).page(params[:page]).per(13)
    destroy_notification(@messages)
    @message = Message.new  
  end
  
  def new
    @available_mentors = User.scoped.available_mentors(current_user).order("first_name ASC").page(params[:page]).per(10)
  end
  
  def create
    @apprenticeship = Apprenticeship.new(student: current_user, mentor: User.find(params[:id]))

    if @apprenticeship.save
      redirect_to apprenticeship_url(@apprenticeship), :notice => "Apprenticeship created!"
    else
      redirect_to new_apprenticeship_url, :notice => "Apprenticeship not established.."
    end
    @apprenticeship.build_corkboard(notes: "This is your Corkboard! Click here to edit the text inside and create useful notes for your apprenticeship!").save
  end
end
