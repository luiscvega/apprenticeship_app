class ResourcesController < ApplicationController
  before_filter :require_user

  def index
    @resources = current_apprenticeship.resources.all
  end
  
  def new
    @resource = Resource.new
  end
  
  def create
    @resource = current_apprenticeship.resources.create(params[:resource])
    @resource.user = current_user
    
    if @resource.save
      redirect_to apprenticeship_resources_url, :notice => "You sent a message!"
    else
      redirect_to apprenticeship_resources_url, :notice => "Invalid message."
    end
  end
end
