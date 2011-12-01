class Message < ActiveRecord::Base  
  
  after_save :notify
  
  default_scope :order => 'messages.created_at DESC'
  
  belongs_to :apprenticeship
  
  has_one :notification
  
  belongs_to :user
  
  def notify
    notification = self.build_notification
    notification.apprenticeship = self.apprenticeship
    notification.save
  end

end