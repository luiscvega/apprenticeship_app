class FeedbacksController < ApplicationController
  def create
    Feedback.create(text: params[:text])
    redirect_to :back, :notice => "I appreciate your feedback! Thanks! -Luis"
  end
end
