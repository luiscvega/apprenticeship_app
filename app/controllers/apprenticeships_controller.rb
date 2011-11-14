class ApprenticeshipsController < ApplicationController
  before_filter :require_user
  
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
    @available_mentors = User.where(:mentor => true)
    @available_mentors = User.where("id <> ?", current_user.id)
    @unavailable_mentors = []
    
    current_user.apprenticeships.each do |apprenticeship|
      @unavailable_mentors << apprenticeship.mentor
      @unavailable_mentors << apprenticeship.student
    end
    
    @available_mentors =   @available_mentors.reject do |mentor|
      @unavailable_mentors.include?(mentor)
    end
  end
  
  def create
    @apprenticeship = Apprenticeship.new
    @apprenticeship.student = current_user
    @apprenticeship.mentor = User.find(params[:id])

    if @apprenticeship.save
      redirect_to apprenticeships_url, :notice => "Apprenticeship created!!"
    else
      redirect_to new_apprenticeship_url, :notice => "Apprenticeship not established.."
    end
      
  end
end
