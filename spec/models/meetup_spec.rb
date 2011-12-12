require 'spec_helper'

describe Meetup do
  before(:each) do
    @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
    @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
    @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
    @meetup = @apprenticeship.meetups.create(time: "1:11:11", date: "11/11/11", venue: "Groupon", description: "Talk about project.")
  end
  
  describe "apprenticeship associations" do

    it "should have apprenticeship attribute indicating which 'apprenticeship' it belongs to" do
      @meetup.should respond_to(:apprenticeship)
      @meetup.apprenticeship.should == @apprenticeship
    end
  end
  
  describe "user associations" do

    before(:each) do
      @meetup = @student.meetups.create(:venue => "I'm a meetup!")
    end

    it "should have user attribute indicating which 'user' it belongs to" do
      @meetup.should respond_to(:user)
      @meetup.user.should == @student
    end

  end
  
  describe "notification association" do
    
    it "should have a 'notification' method indicating its has_one association" do
      @meetup.should respond_to(:notification)
    end
    
    it "should have a 'notify' method after saving" do
      @meetup.should respond_to(:notify)
    end

  end

  describe "specific methods" do
    it "should have a recipient attribute indicating the intended user the meetup was for" do
      @meetup = @student.meetups.create(venue: "Groupon", recipient: @mentor)
      @meetup.recipient.should == @mentor
    end

  end
end
