class Conversation < ActiveRecord::Base
  belongs_to :apprenticeship
  belongs_to :user
end
