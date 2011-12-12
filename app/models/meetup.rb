class Meetup < ActiveRecord::Base
  belongs_to :apprenticeship
  belongs_to :user

  has_one :notification, as: :notifiable
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"  
  
  after_save :notify
  
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"  

  def notify
    notification = self.create_notification(apprenticeship: self.apprenticeship)
  end
end
