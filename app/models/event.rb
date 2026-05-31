class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :title, :location, :planned_date, presence: true
end
