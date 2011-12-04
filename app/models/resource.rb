class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :apprenticeship
  has_one :notification, as: :notifiable
  
  after_save :notify
  
  def notify
    notification = self.create_notification(apprenticeship: self.apprenticeship)
  end
end
