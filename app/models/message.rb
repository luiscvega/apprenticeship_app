class Message < ActiveRecord::Base  
  
  after_save :notify
  
  default_scope :order => 'messages.created_at DESC'
  
  belongs_to :apprenticeship
  
  has_one :notification
  
  belongs_to :user
  
  def notify
    self.create_notification
  end

end
