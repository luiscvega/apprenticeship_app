class MessagesController < ApplicationController
  def index
    @messages = current_apprenticeship.messages.all
    @message = Message.new
  end
  
  def create
    @message = current_apprenticeship.messages.new(params[:message])
    @message.user = current_user
    
    if @message.save
      redirect_to apprenticeship_messages_url, :notice => "You sent a message!"
    else
      redirect_to apprenticeship_messages_url, :notice => "Invalid message."
    end
  end
end
