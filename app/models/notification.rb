class Notification < ActiveRecord::Base
  belongs_to :apprenticeship
  
  belongs_to :message
  
  def creator
    message.user || meetup.user || resource.user
  end
end