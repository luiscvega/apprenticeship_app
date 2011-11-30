require 'spec_helper'

describe Notification do
  before(:each) do
     @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
     @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
     @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
   end

   describe "message association" do
     
     it "should create a notififcation" do
      # @message = @apprenticeship.messages.create(:text => "I'm a message!")
    end
   end
end
