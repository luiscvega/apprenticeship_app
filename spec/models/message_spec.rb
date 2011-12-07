require 'spec_helper'

describe Message do

  before(:each) do
    @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
    @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "fred", :password_confirmation => "fred", :description => "I'm Fred!")
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

    it "should have user attribute indicating which 'user' it belongs to" do
      @message = @student.messages.create(:text => "I'm a message!")
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
  
  describe "specific methods" do
    before(:each) do
      @message = @student.messages.create(:text => "I'm a message!")
    end 

    it "should have a recipient attribute indicating the intended user the message was for" do
      @message.should respond_to(:recipient_id)
      @message.recipient.should == @mentor
    end
    
    # it "should have a notification_count method indicating how many message notifications a specific apprenticeship's has" do
    #   @m1 = @apprenticeship.messages.create(text: "Message 1", user: @student)
    #   @m2 = @apprenticeship.messages.create(text: "Message 2", user: @student)
    #   @apprenticeship.messages.notification_count.should respond_to(:notification_count)
    #   @apprenticeship.messages.notification_count.should == 2
    # end
  end

end
