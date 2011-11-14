class MeetupsController < ApplicationController
  def index
    @meetups = current_apprenticeship.meetups.all
    @meetup = Resource.new
  end
end
