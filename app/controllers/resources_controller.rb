class ResourcesController < ApplicationController
  def index
    @resources = current_apprenticeship.resources.all
  end
end
