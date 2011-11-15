class FeedbacksController < ApplicationController
  def create
    Feedback.create(text: params[:text])
    redirect_to :back
  end
end
