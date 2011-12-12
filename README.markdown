# Code Apprentice a.k.a Apprenticeship Application (Latest Version)
### A web app where Students and Mentors can interact in Apprenticeships

When User A creates an account, he can add Mentors from a list of available mentors. ANYONE can be mentor. User A can create a student-mentor relationship (called an 'apprenticeship'). Likewise, other users can add User A as their mentor.

If User A doesn't want to be in a list of available mentors (hence not allowing any new apprenticeships to be created), User A can turn off his "Mentor Mode". In a nutshell, if Mentor Mode is turned "ON", other people can add that user as a mentor. If Mentor Mode is turned "OFF", the user will not be in the list of available mentors, hence will not accept new apprenticeships.

### Notification System

The notification system is where a Student A will send a message to Mentor B, and Mentor B will see an indicator that he has received a new message. It's similar to Facebook's Notification system, where if you have 3 new messages, it will show the total number of new messages. In the case of my application, it will show "Messages (3)". I do this by creating a new table called "Notification", where a message has_one notification. When a message is created, a callback function is called and creates a new notification for that message in the Notification table

<pre><code>
after_save :notify

def notify
  notification = self.create_notification(apprenticeship: self.apprenticeship)
end
</code></pre>

I count the messages using this method:

<pre><code>
# In the Controller  
  
def unread_messages
  Message.joins(:notification).where(recipient_id: self.id)
end

# In the View (Note: Index page view list each apprenticeships, so I have to scope further and indicate which apprenticeship exactly)

= link_to "Messages #{"(#{current_user.unread_messages.where(apprenticeship_id: apprenticeship.id).count})" unless current_user.unread_messages.where(apprenticeship_id: apprenticeship.id).count == 0 }", apprenticeship_url(apprenticeship)
</code></pre>

I then delete the notifications when the user goes into the show page of the apprenticeship (where the messages are listed)

<pre><code>
# In the Application Controller (I placed in this in the Application Controller since use this method to delete other notification collections other than messages, such as meetups and resources).

def destroy_notifications(collection)
  collection.each do |message|
    message.notification.destroy if !message.notification.nil? && message.notification.creator != current_user
  end
end

# In Apprenticeships controller, Index action

@messages = current_apprenticeship.messages.order(:created_at).page(params[:page]).per(13)
destroy_notifications(@messages)

</code></pre>

### Other interesting code:

Scoping 'Available Mentors' from Users

<pre><code>
scope :available_mentors, lambda { |current_user| 
    where("mentor = ?", true).
    where("id <> ?", current_user.id).
    where(["id NOT IN (?)", current_user.apprenticeships.map {|u| u.student.id }]).
    where(["id NOT IN (?)", current_user.apprenticeships.map {|u| u.mentor.id }])
  }
</code></pre>



<pre><code>
</code></pre>

<pre><code>
</code></pre>

<pre><code>
</code></pre>