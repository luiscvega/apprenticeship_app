class Message < ActiveRecord::Base  
  
  after_save :notify
  
  default_scope :order => 'messages.created_at DESC'
  
  belongs_to :apprenticeship
  
  has_one :notification, as: :notifiable

  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"  
  belongs_to :sender, class_name: "User", foreign_key: "user_id"
  
  belongs_to :user
  
  def notify
    self.create_notification(apprenticeship: self.apprenticeship)
  end
  
  # def notification_count
  #   # self.messages.select do |message|
  #   #  if message.notification
  #   #    message.notification.creator != current_user
  #   #   end
  #   # end
  # end
end
