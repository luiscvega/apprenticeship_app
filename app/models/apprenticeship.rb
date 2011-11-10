class Apprenticeship < ActiveRecord::Base
  
  has_many :messages
  
  belongs_to :mentor,
             :class_name => "User",
             :foreign_key => "mentor_id"
             
  belongs_to :student,
             :class_name => "User",
             :foreign_key => "student_id"
end
