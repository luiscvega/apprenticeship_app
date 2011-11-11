require 'spec_helper'

describe Resource do
  before(:each) do
    @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
    @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
    @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
  end
  
  describe "user associations" do
  
    before(:each) do
      @resource = @student.resources.create(:link => "http://google.com", :title => "Google", :description => "For searching.")
    end
  
    it "should have user attribute indicating which 'user' it belongs to" do
      @resource.should respond_to(:user)
      @resource.user.should == @student
    end
  
  end
end
