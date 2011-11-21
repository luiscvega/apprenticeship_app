class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_confirmation(user)
    @user = user
    
    mail :from => "notifications@codeapprentice.org",
         :to => "luisitovegs@yahoo.com",
         :subject => "Welcome to Code Apprentice!"
  end
end
