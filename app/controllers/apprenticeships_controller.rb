class ApprenticeshipsController < ApplicationController
  def index
    @apprenticeships = current_user.apprenticeships
  end
end
