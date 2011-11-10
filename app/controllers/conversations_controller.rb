class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
    @conversation = Conversation.new
  end
  
  def create
    @conversation = Conversation.new(params[:conversation])
    if @conversation.save
      redirect_to conversations_url, :notice => "You sent a message!"
    else
      redirect_to conversations_url, :notice => "Invalid message."
    end
  end
end
