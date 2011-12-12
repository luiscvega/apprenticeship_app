class User < ActiveRecord::Base

  has_secure_password
  
  has_many :messages
  has_many :meetups  
  has_many :resources
  
  has_many :mentorships, :class_name => "Apprenticeship", :foreign_key => "mentor_id"
  has_many :studentships, :class_name => "Apprenticeship", :foreign_key => "student_id"
           
  validates_presence_of :email, :first_name, :last_name, :description
  validates_uniqueness_of :email
  
  scope :available_mentors, lambda { |current_user| 
      where("mentor = ?", true).
      where("id <> ?", current_user.id).
      where(["id NOT IN (?)", current_user.apprenticeships.map {|u| u.student.id }]).
      where(["id NOT IN (?)", current_user.apprenticeships.map {|u| u.mentor.id }])
    }
           
  def apprenticeships
    mentorships + studentships
  end
  
  def full_name
    first_name + " " + last_name
  end
  
  def toggle
    mentor ? update_attributes(mentor: false) : update_attributes(mentor: true) #if mentor mode is true, switch to false, and vice versa
  end

  def unread_messages
    Message.joins(:notification).where(recipient_id: self.id)
  end

  def unread_meetups 
    Meetup.joins(:notification).where(recipient_id: self.id)
  end

  def unread_resources
    Resource.joins(:notification).where(recipient_id: self.id)
  end

end

