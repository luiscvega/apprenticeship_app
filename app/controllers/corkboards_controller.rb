class CorkboardsController < ApplicationController
  can_edit_on_the_spot
  
  def new
    @corkboard = Corkboard.find(1)
  end
end
