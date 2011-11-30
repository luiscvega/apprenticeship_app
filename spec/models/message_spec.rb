require 'spec_helper'

describe Message do

  before(:each) do
    @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
    @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "miguel", :password_confirmation => "fred", :description => "I'm Fred!")
    @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
  end

  describe "apprenticeship associations" do

    before(:each) do
      @message = @apprenticeship.messages.create(:text => "I'm a message!")
    end

    it "should have apprenticeship attribute indicating which 'apprenticeship' it belongs to" do
      @message.should respond_to(:apprenticeship)
      @message.apprenticeship.should == @apprenticeship
    end

  end
  
  describe "user associations" do

    before(:each) do
      @message = @student.messages.create(:text => "I'm a message!")
    end

    it "should have user attribute indicating which 'user' it belongs to" do
      @message.should respond_to(:user)
      @message.user.should == @student
    end

  end
  
  describe "notification association" do
    before(:each) do
      @message = @student.messages.create(:text => "I'm a message!")
    end
    
    it "should have a 'notification' method indicating its has_one association" do
      @message.should respond_to(:notification)
    end

    it "should have a 'notify' method after saving" do
      @message.should respond_to(:notify)
    end

  end
  
    

end
