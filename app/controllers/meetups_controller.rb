class MeetupsController < ApplicationController
  def index
    @meetups = current_apprenticeship.meetups.all
    @meetup = Meetup.new
  end
  
  def create
    @meetup = current_apprenticeship.meetups.create(params[:meetup])
    
    if @meetup.save
      redirect_to apprenticeship_meetups_url, :notice => "Hooray! You've added a meetup!"
    else
      redirect_to apprenticeship_meetups_url, :notice => "Hmm, your meetup wasn't added."
    end
  end
end
