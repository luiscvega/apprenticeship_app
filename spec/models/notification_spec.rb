require 'spec_helper'

describe Notification do
  before(:each) do
   @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
   @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "fred", :password_confirmation => "fred", :description => "I'm Fred!")
   @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
  end
  
  describe "apprenticeship association" do
    it "should have a apprenticeship attribute indicating which apprenticeship the correct apprenticeship" do
      @message = @apprenticeship.messages.create(:text => "I'm a message!")
      @notification = Notification.find_by_message_id(@message)
      @notification.should respond_to(:apprenticeship)
    end
    
  end

  describe "message association" do
    it "should create a notififcation with the proper apprenticehip" do
      @message = @apprenticeship.messages.create(:text => "I'm a message!")
      @notification = Notification.find_by_message_id(@message)
      @message.notification.should == @notification
      @notification.apprenticeship.should == @apprenticeship
    end
  end

  describe "unique methods" do
    before :each do
      @message = @student.messages.create(:text => "I'm a message!")
      @message.update_attributes(apprenticeship: @apprenticeship)
      @notification = Notification.find_by_message_id(@message)
    end
    
    it "should have a message/meetup/resource attribute indicating which message/meetup/resource it belongs to" do
      @notification.should respond_to :message
      @notification.message.should == @message
    end
    
    it "should have creator attribute indicating who made the notification" do
      @notification.should respond_to(:creator)
      @notification.creator.should == @student
    end
  end
end
