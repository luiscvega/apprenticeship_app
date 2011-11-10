require 'spec_helper'

describe User do

  describe "apprenticeship associations" do

    before(:each) do
      @student = User.create(:first_name => "Luis", :last_name => "Vega", :email => "luis@luis.com", :password => "luis", :password_confirmation => "luis", :description => "I'm Luis!")
      @mentor = User.create(:first_name => "Fred", :last_name => "Lee", :email => "fred@fred.com", :password => "fred", :password_confirmation => "fred", :description => "I'm Fred!")
      @student2 = User.create(:first_name => "Abe", :last_name => "Lincoln", :email => "abe@abe.com", :password => "abe", :password_confirmation => "abe", :description => "I'm Abe!")
      @mentor2 = User.create(:first_name => "Barack", :last_name => "Obama", :email => "barack@barack.com", :password => "barack", :password_confirmation => "barack", :description => "I'm Abe!")
      @apprenticeship = Apprenticeship.create(:mentor_id => @mentor.id, :student_id => @student.id)
      @apprenticeship2 = Apprenticeship.create(:mentor_id => @mentor2.id, :student_id => @student2.id)
    end

    it "should have a mentorships attribute listing all apprenticeships where the user is a mentor" do
      @mentor.mentorships.should include(@apprenticeship) 
    end
    
    it "should have a studentships attribute listing all apprenticeships where the user is a student" do
      @student.studentships.should include(@apprenticeship)
    end
    
    it "should not include apprenticeships where the mentor is not the actual mentor" do
      @student.studentships.should_not include(@student2)
      @mentor.mentorships.should_not include(@mentor2)
    end
    
    it "should have an apprenticeships attribute listing all of the user's apprenticeships" do
      @student.apprenticeships.should include(@apprenticeship)
    end
  end
end
