class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to messages_url, :notice => "You sent a message!"
    else
      redirect_to messages_url, :notice => "Invalid message."
    end
  end
end
