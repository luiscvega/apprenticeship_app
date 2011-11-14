require 'spec_helper'

describe Meetup do
  before(:each) do
    @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
    @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
    @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
  end
  
  describe "apprenticeship associations" do

    before(:each) do
      @meetup = @apprenticeship.meetups.create(time: "1:11:11", date: "11/11/11", venue: "Groupon", description: "Talk about project.")
    end

    it "should have apprenticeship attribute indicating which 'apprenticeship' it belongs to" do
      @meetup.should respond_to(:apprenticeship)
      @meetup.apprenticeship.should == @apprenticeship
    end
  end
end
