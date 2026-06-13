class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :title, :location, :planned_date, :is_private, presence: true

  has_many :invitations, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :invitations

  scope :past, -> { where("planned_date < '#{Date.today}'") }
  scope :future, -> { where("planned_date >= '#{Date.today}'") }

  def public?
    return false if self.is_private == true
    true
  end
end
