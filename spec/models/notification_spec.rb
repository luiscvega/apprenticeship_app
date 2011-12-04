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
      @notification = Notification.find_by_notifiable_id(@message)
      @notification.should respond_to(:apprenticeship)
      @notification.apprenticeship.should == @apprenticeship
    end
    
  end

  describe "message association" do
    it "should create a notififcation with the proper apprenticeship" do
      @message = @apprenticeship.messages.create(:text => "I'm a message!")
      @notification = Notification.find_by_notifiable_id(@message)
      @message.notification.should == @notification
      @notification.apprenticeship.should == @apprenticeship
    end
  end
  
  describe "meetup association" do
    it "should create a notififcation with the proper apprenticeship" do
      @meetup = @apprenticeship.meetups.create(:venue => "Navy Pier!")
      @notification = Notification.find_by_notifiable_id(@meetup)
      @meetup.notification.should == @notification
      @notification.apprenticeship.should == @apprenticeship
    end
  end
  
  describe "resource association" do
    it "should create a notififcation with the proper apprenticeship" do
      @resource = @apprenticeship.resources.create(:link => "http://google.com")
      @notification = Notification.find_by_notifiable_id(@resource)
      @resource.notification.should == @notification
      @notification.apprenticeship.should == @apprenticeship
    end
  end

  describe "unique methods" do
    before :each do
      @message = @student.messages.create(:text => "I'm a message!")
      @message.update_attributes(apprenticeship: @apprenticeship)
      @notification = Notification.find_by_notifiable_id(@message)
    end
    
    it "should have a notifiable attribute indicating which message/meetup/resource it belongs to" do
      @notification.should respond_to :notifiable
      @notification.notifiable.should == @message
    end
    
    it "should have creator attribute indicating who made the notification" do
      @notification.should respond_to(:creator)
      @notification.creator.should == @student
    end
  end
end
