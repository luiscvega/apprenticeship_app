class MessagesController < ApplicationController
  before_filter :require_user
    
  def index
    @messages = current_apprenticeship.messages.all
    @message = Message.new
  end
  
  def create
    @message = current_apprenticeship.messages.new(params[:message])
    @message.user = current_user
    
    if @message.save
      redirect_to apprenticeship_url(current_apprenticeship), :notice => "You sent a message!"
    else
      redirect_to apprenticeship_url(current_apprenticeship), :notice => "Invalid message."
    end
  end
end
