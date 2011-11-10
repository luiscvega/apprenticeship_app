class User < ActiveRecord::Base

  has_secure_password
  
  has_many :messages
  
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
