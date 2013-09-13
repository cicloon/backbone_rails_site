class InviteeSign < ActiveRecord::Base
  belongs_to :invitee
  belongs_to :sign
  # attr_accessible :title, :body
end
