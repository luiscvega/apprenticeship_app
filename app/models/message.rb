class Message < ActiveRecord::Base  
  
  after_save :notify
  
  default_scope :order => 'messages.created_at DESC'
  
  belongs_to :apprenticeship
  
  has_one :notification, as: :notifiable
  
  belongs_to :user
  
  def notify
    notification = self.create_notification(apprenticeship: self.apprenticeship)
  end
  
  # def notification_count
  #   # self.messages.select do |message|
  #   #  if message.notification
  #   #    message.notification.creator != current_user
  #   #   end
  #   # end
  # end
end
