class User < ActiveRecord::Base

  has_secure_password
  
  has_many :conversations
  has_many :apprenticeships
  
end
