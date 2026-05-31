class Invitation < ApplicationRecord
  belongs_to :attended_event, class_name: "Event"
  belongs_to :attendee, class_name: "User"

  validates :attended_event_id, :attendee_id, presence: true
end
