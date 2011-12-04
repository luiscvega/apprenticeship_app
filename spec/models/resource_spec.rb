require 'spec_helper'

describe Resource do
  before(:each) do
    @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
    @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
    @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
    @resource = @apprenticeship.resources.create(:link => "http://google.com", :title => "Google", :description => "For searching.")
  end
  
  describe "apprenticeship associations" do

    it "should have apprenticeship attribute indicating which 'apprenticeship' it belongs to" do
      @resource.should respond_to(:apprenticeship)
      @resource.apprenticeship.should == @apprenticeship
    end
  end
  
  describe "user associations" do
    before(:each) do
      @resource = @student.resources.create(:link => "http://google.com")
    end
  
    it "should have user attribute indicating which 'user' it belongs to" do
      @resource.should respond_to(:user)
      @resource.user.should == @student
    end
  
  end
  
  describe "notification association" do
    
    it "should have a 'notification' method indicating its has_one association" do
      @resource.should respond_to(:notification)
    end
    
    it "should have a 'notify' method after saving" do
      @resource.should respond_to(:notify)
    end

  end
  
end
