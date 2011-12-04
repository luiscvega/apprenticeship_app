class Notification < ActiveRecord::Base
  belongs_to :apprenticeship
  
  belongs_to :notifiable, polymorphic: true
  
  def creator
    self.notifiable.user
  end
end