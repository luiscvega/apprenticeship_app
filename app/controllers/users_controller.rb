class UsersController < ApplicationController
  def toggle
    current_user.toggle
    redirect_to new_apprenticeship_url, notice: "Mentor Mode Changed!"
  end
end
