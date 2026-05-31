class Invitation < ApplicationRecord
  belongs_to :attended_event, class_name: "Event"
  belongs_to :attendee, class_name: "User"

  validates :attended_event_id, :attendee_id, presence: true
  validates :attended_event_id, uniqueness: { scope: :attendee_id }
end
