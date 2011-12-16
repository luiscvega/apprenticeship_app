class MeetupsController < ApplicationController
  
  def index
    @meetups = current_apprenticeship.meetups.all
    destroy_notifications(@meetups)
    @meetup = Meetup.new
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def new
    @meetup = Meetup.new
  end
  
  def create
    @meetup = current_apprenticeship.meetups.build(params[:meetup])
    @meetup.user = current_user
    @meetup.recipient = other_user
    
    if @meetup.save
      redirect_to user_url(current_user), :notice => "Hooray! You've added a meetup!"
    else
      redirect_to apprenticeship_meetups_url, :notice => "Hmm, your meetup wasn't added."
    end
  end
  
  def edit
    @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup = Meetup.find(params[:id])
    @meetup.update_attributes(params[:meetup])
    if @meetup.save
      redirect_to apprenticeship_meetups_url(current_apprenticeship), :notice => "Hooray! You've edited a meetup!"
    else
      redirect_to apprenticeship_meetups_url(current_apprenticeship), :notice => "Hmm, your meetup wasn't edited."
    end
  end

  def destroy
    Meetup.find(params[:id]).destroy
    redirect_to apprenticeship_meetups_url, :notice => "Meetup was deleted! Kaboom!" 
  end
  

end
