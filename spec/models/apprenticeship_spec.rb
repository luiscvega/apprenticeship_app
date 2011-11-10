require 'spec_helper'

describe Apprenticeship do
  describe "user associations" do
    before(:each) do
      @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
      @mentor = User.create(:first_name => "Miguel", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
      @apprenticeship = Apprenticeship.new
    end
  
    it "should be able to assign a mentor" do
      @apprenticeship.mentor = @mentor
      @apprenticeship.save.should be_true
    end
  
    it "should be able to assign a student" do
      @apprenticeship.student = @student
      @apprenticeship.save.should be_true
    end
  end
end
