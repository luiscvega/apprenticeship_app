class Meetup < ActiveRecord::Base
  belongs_to :apprenticeship
  belongs_to :user

  has_one :notification, as: :notifiable
  
  after_save :notify
  
  def notify
    notification = self.create_notification(apprenticeship: self.apprenticeship)
  end
end
