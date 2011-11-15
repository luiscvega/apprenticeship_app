class User < ActiveRecord::Base

  has_secure_password
  
  has_many :messages
  
  has_many :resources
  
  has_many :mentorships,
           :class_name => "Apprenticeship",
           :foreign_key => "mentor_id"

  has_many :studentships,
           :class_name => "Apprenticeship",
           :foreign_key => "student_id"
           
  validates_presence_of :email, :first_name, :last_name, :description
  validates_uniqueness_of :email
           
  def apprenticeships
    self.mentorships + self.studentships
  end
  
  def full_name
    self.first_name + " " + self.last_name
  end
  
  def toggle
    if self.mentor == true
      self.mentor = false
      self.save
    else
      self.mentor = true
      self.save
    end
  end

end
