class Apprenticeship < ActiveRecord::Base
  
  has_one :corkboard
  
  has_many :messages
  
  has_many :meetups
  
  has_many :resources
  
  belongs_to :mentor,
             :class_name => "User",
             :foreign_key => "mentor_id"
             
  belongs_to :student,
             :class_name => "User",
             :foreign_key => "student_id"
end
