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
  
end
