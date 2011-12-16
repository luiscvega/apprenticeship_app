class User < ActiveRecord::Base

  has_secure_password
  
  has_many :notifications
  
  has_many :messages
  has_many :meetups  
  has_many :resources
  
  has_many :mentorships, :class_name => "Apprenticeship", :foreign_key => "mentor_id"
  has_many :studentships, :class_name => "Apprenticeship", :foreign_key => "student_id"
           
  validates_presence_of :email, :first_name, :last_name, :description
  validates_uniqueness_of :email
  
  scope :available_mentors, lambda { |current_user| 
      where("mentor = ?", true).      #Mentor Mode must be ON
      where("id <> ?", current_user.id).      # Doesn't include the current_user
      where(["id NOT IN (?)", (current_user.apprenticeships.map {|a| a.student.id }.nil? ? []  : current_user.apprenticeships.map {|a| a.student.id }.nil? )]).
      where(["id NOT IN (?)", (current_user.apprenticeships.map {|a| a.mentor.id }.nil? ? []  : current_user.apprenticeships.map {|a| a.mentor.id }.nil? )])
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
  
  def has_unread?
    self.unread_messages.any? || self.unread_meetups.any? || self.unread_resources.any?
  end

end

