class User < ActiveRecord::Base

  has_secure_password
  
  has_many :conversations
  
  has_many :mentorships,
           :class_name => "Apprenticeship",
           :foreign_key => "mentor_id"

  has_many :studentships,
           :class_name => "Apprenticeship",
           :foreign_key => "student_id"
           
  def apprenticeships
    self.mentorships + self.studentships
  end

end
