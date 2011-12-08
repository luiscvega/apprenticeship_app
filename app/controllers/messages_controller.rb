class MessagesController < ApplicationController
    
  def index
    @messages = current_apprenticeship.messages.all
    @message = Message.new
  end
  
  def create
    @message = current_apprenticeship.messages.build(params[:message])
    @message.sender = current_user
    @message.recipient = other_user
    
    if @message.save
      redirect_to apprenticeship_url(current_apprenticeship)
    else
      redirect_to apprenticeship_url(current_apprenticeship)
    end
    
  end
end
