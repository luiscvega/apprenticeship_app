class ResourcesController < ApplicationController
  before_filter :require_user

  def index
    @resources = current_apprenticeship.resources.all
    @resource = Resource.new
  end
  
  def new
    @resource = Resource.new
  end
  
  def create
    @resource = current_apprenticeship.resources.create(params[:resource])
    @resource.user = current_user
    
    if @resource.save
      redirect_to apprenticeship_resources_url, :notice => "Hooray! You've added a resource!"
    else
      redirect_to apprenticeship_resources_url, :notice => "Hmm, your resource wasn't added."
    end
  end
  
  def edit
    @resource = Resource.find(params[:id])
  end
  
  def update
    @resource = Resource.find(params[:id])
    @resource.update_attributes(params[:resource])
    if @resource.save
      redirect_to apprenticeship_resources_url, :notice => "Hooray! You've added a resource!"
    else
      redirect_to apprenticeship_resources_url, :notice => "Hmm, your resource wasn't added."
    end
  end
  
  def destroy
    Resource.find(params[:id]).destroy
    redirect_to apprenticeship_resources_url, :notice => "Resource was deleted! Kaboom!" 
  end
end
