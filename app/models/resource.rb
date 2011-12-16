class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :apprenticeship
  has_one :notification, as: :notifiable
  
  after_save :notify

  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, class_name: "User", foreign_key: "user_id"
  
  def notify
    notification = self.create_notification(apprenticeship: self.apprenticeship)
  end
end
