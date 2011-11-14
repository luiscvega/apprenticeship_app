require 'spec_helper'

describe Apprenticeship do
  before(:each) do
    @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
    @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
    @apprenticeship = Apprenticeship.new
  end
  
  describe "user associations" do
  
    it "should be able to assign a mentor" do
      @apprenticeship.mentor = @mentor
      @apprenticeship.save.should be_true
    end
  
    it "should be able to assign a student" do
      @apprenticeship.student = @student
      @apprenticeship.save.should be_true
    end
  end
  
  describe "message associations" do
    
    before(:each) do
      @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
      @message = {:text => "I'm a message!"}
    end

    it "should have a messages attribute to create a message with the correct apprenticeship" do
      @apprenticeship.messages.create(@message).should be_valid
    end
    
  end
  
  describe "resources associations" do
    
    before(:each) do
      @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
      @resource = {:link => "http://google.com", :title => "Google", :description => "For searching."}
    end

    it "should have a resources attribute to create a resource with the correct apprenticeship" do
      @apprenticeship.resources.create(@resource).should be_true
    end
    
  end
  
  describe "meetup associations" do

     before(:each) do
       @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
       @meetup = {time: "1:11:11", date: "11/11/11", venue: "Groupon", description: "Talk about project."}
     end

     it "should have a meetups attribute to create a meetup with the correct apprenticeship" do
       @apprenticeship.meetups.create(@meetup).should be_true
     end

   end
end
